using JetBrains.Annotations;
using UniRx.Async;

namespace Naninovel.Commands {
    [CommandAlias("inkChoice"), UsedImplicitly]
    public class InkChoice : Command {
        [ParameterAlias(NamelessParameterAlias), UsedImplicitly]
        public IntegerParameter ChoiceIndex;

        public override UniTask ExecuteAsync(CancellationToken cancellationToken = default) {
            NaninovelInkAdapter.Choose(ChoiceIndex);
            return UniTask.CompletedTask;
        }
    }
}