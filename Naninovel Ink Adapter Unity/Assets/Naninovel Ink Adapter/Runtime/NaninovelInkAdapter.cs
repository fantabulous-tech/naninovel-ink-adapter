using System.Text;
using Ink.Runtime;
using Naninovel;
using UnityEngine;
using UnityEngine.Serialization;

public class NaninovelInkAdapter : MonoBehaviour {
    private static NaninovelInkAdapter s_Instance;

    [FormerlySerializedAs("inkJSONAsset"),SerializeField] private TextAsset m_InkJsonAsset;

    private IScriptPlayer m_ScriptPlayer;
    private int m_ScriptIndex;

    /// <summary>
    /// The currently running Ink story.
    /// </summary>
    public Story Story { get; private set; }

    private void Start() {
        s_Instance = this;
    }

    /// <summary>
    ///     Allows custom @startInkStory Naninovel command to start the ink story.
    /// </summary>
    public static void StartStory() {
        s_Instance.Story = new Story(s_Instance.m_InkJsonAsset.text);
        s_Instance.m_ScriptPlayer = Engine.GetService<IScriptPlayer>();
        s_Instance.Continue();
    }

    /// <summary>
    ///     Allows custom @inkChoice Naninovel command to choose a choice by index.
    /// </summary>
    /// <param name="choiceIndex">The index to choose.</param>
    public static void Choose(int choiceIndex) {
        s_Instance.Story.ChooseChoiceIndex(choiceIndex);
        s_Instance.Continue();
    }

    private void Continue() {
        StringBuilder sb = new StringBuilder(Story.ContinueMaximally());

        // Add @choice commands to end of script for each ink choice.
        foreach (Choice choice in Story.currentChoices) {
            sb.AppendLine($"@choice \"{choice.text}\" goto:.Choice{choice.index}");
        }

        sb.AppendLine("@stop");

        // Add corresponding # Choice labels for each choice that trigger the matching @inkChoice command
        foreach (Choice choice in Story.currentChoices) {
            sb.AppendLine();
            sb.AppendLine($"# Choice{choice.index}");
            sb.AppendLine($"@inkChoice {choice.index}");
            sb.AppendLine("@stop");
        }

        Script naniScript = Script.FromScriptText($"{m_InkJsonAsset.name}{m_ScriptIndex++}", sb.ToString());
        m_ScriptPlayer.Play(naniScript);
    }
}