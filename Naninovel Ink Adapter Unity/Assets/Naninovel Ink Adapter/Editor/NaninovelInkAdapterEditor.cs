using Ink.Runtime;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(NaninovelInkAdapter))]
public class NaninovelInkAdapterEditor : Editor {
    private NaninovelInkAdapter m_Target;

    private void OnEnable() {
        m_Target = (NaninovelInkAdapter) target;
    }

    public override void OnInspectorGUI() {
        base.OnInspectorGUI();

        if (!Application.isPlaying) {
            return;
        }

        if (m_Target.Story == null || m_Target.Story.currentChoices.Count == 0) {
            if (GUILayout.Button("Start Story")) {
                NaninovelInkAdapter.StartStory();
            }
        } else {
            if (GUILayout.Button("Restart Story")) {
                NaninovelInkAdapter.StartStory();
            }
        }

        if (m_Target.Story == null) {
            return;
        }

        foreach (Choice choice in m_Target.Story.currentChoices) {
            if (GUILayout.Button(choice.text)) {
                NaninovelInkAdapter.Choose(choice.index);
            }
        }
    }
}