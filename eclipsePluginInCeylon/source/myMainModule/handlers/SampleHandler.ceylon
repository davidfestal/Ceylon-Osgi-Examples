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
import ceylon.collection {
    ArrayList,
    HashMap
}

shared class SampleHandler() extends AbstractHandler() {
    shared actual Object? execute(variable ExecutionEvent event) {
        value map = HashMap { "a"->"b" };
        print(map["a"]);
        IWorkbenchWindow window = getActiveWorkbenchWindowChecked(event);
        MessageDialog.openInformation(window.shell, *(let (list=ArrayList { "EclipsePluginInCeylon", "Hello, Eclipse world" }) [list.first, list.rest.first]));
        Integer a=0;
        return null;
    }
}
