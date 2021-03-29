using System.Text;
using Ink.Runtime;
using Naninovel;
using UnityEngine;

public class NaninovelInkAdapter : MonoBehaviour {
    private static NaninovelInkAdapter s_Instance;

    [SerializeField] private TextAsset inkJSONAsset;

    public Story Story;
    private IScriptPlayer m_ScriptPlayer;
    private Script m_CurrentScript;
    private int m_ScriptIndex;

    private void Start() {
        if (s_Instance) {
            Debug.LogError("Duplicate InkPlayerAdapter found! (original)", s_Instance);
            Debug.LogError("Duplicate InkPlayerAdapter found! (duplicate)", this);
            return;
        }

        s_Instance = this;
    }

    /// <summary>
    ///     Use @startInk in Naninovel to start the ink story.
    /// </summary>
    public static void StartStory() {
        s_Instance.Story = new Story(s_Instance.inkJSONAsset.text);
        s_Instance.m_ScriptPlayer = Engine.GetService<IScriptPlayer>();
        s_Instance.Continue();
    }

    /// <summary>
    ///     Allows InkChoiceCommand to choose the chosen choice index.
    /// </summary>
    /// <param name="index">The index to choose.</param>
    public static void Choose(int index) {
        s_Instance.Story.ChooseChoiceIndex(index);
        s_Instance.Continue();
    }

    private void Continue() {
        StringBuilder sb = new StringBuilder(Story.ContinueMaximally());

        // Add @choice commands to end of script.
        foreach (Choice choice in Story.currentChoices) {
            sb.AppendLine($"@choice \"{choice.text}\" goto:.Choice{choice.index}");
        }

        sb.AppendLine("@stop");

        // Add # Choice goto labels
        foreach (Choice choice in Story.currentChoices) {
            sb.AppendLine();
            sb.AppendLine($"# Choice{choice.index}");
            sb.AppendLine($"@inkChoice {choice.index}");
            sb.AppendLine("@stop");
        }

        string storyName = $"{inkJSONAsset.name}{m_ScriptIndex++}";
        string naniStoryText = sb.ToString();
        Debug.Log($"Creating story '{storyName}':\n{naniStoryText}");

        m_CurrentScript = Script.FromScriptText(storyName, naniStoryText);
        m_ScriptPlayer.Stop();
        m_ScriptPlayer.Play(m_CurrentScript);
    }
}