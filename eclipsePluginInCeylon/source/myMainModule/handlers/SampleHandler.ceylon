import org.eclipse.core.commands{
AbstractHandler,
ExecutionEvent
}
import org.eclipse.ui {
    IWorkbenchWindow
}
import org.eclipse.ui.handlers {
    HandlerUtil {
        getActiveWorkbenchWindowChecked
    }
}
import org.eclipse.jface.dialogs {
    MessageDialog
}

shared class SampleHandler() extends AbstractHandler() {
    shared actual Object? execute(variable ExecutionEvent event) {
        IWorkbenchWindow window = getActiveWorkbenchWindowChecked(event);
        MessageDialog.openInformation(window.shell, "EclipsePluginInCeylon", "Hello, Eclipse world");
        return null;
    }
}
