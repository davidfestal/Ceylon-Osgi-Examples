import org.eclipse.ui.plugin {
    AbstractUIPlugin
}
import org.osgi.framework {
    BundleContext
}
import org.eclipse.jface.resource {
    ImageDescriptor
}

"The plug-in ID"
shared String pluginId = "eclipsePluginInCeylon";

shared variable Activator? plugin = null;

"
 The activator class controls the plug-in life cycle
 "
shared class Activator() extends AbstractUIPlugin() {

    shared actual void start(BundleContext context) {
        super.start(context);
        plugin = this;
    }

    shared actual void stop(BundleContext context) {
        plugin = null;
        super.stop(context);
    }

    "
     Returns an image descriptor for the image file at the given
     plug-in relative path
     "
    shared ImageDescriptor getImageDescriptor(String path)
        => imageDescriptorFromPlugin(pluginId, path);
}
