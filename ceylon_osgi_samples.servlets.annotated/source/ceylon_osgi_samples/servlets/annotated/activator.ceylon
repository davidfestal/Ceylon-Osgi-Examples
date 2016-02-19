import com.redhat.ceylon.dist.osgi {
    DefaultActivator = Activator
}
import org.osgi.framework {
    BundleContext
}

shared class Activator() extends DefaultActivator() {
    shared actual void start(BundleContext context) {
        super.start(context);
    }
    shared actual void stop(BundleContext context) {
        super.stop(context);
    }
}

