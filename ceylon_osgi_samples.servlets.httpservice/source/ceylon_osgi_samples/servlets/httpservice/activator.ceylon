 import com.redhat.ceylon.dist.osgi {
    DefaultActivator = Activator
}
import org.osgi.framework {
    BundleContext,
    ServiceReference
}
import org.osgi.util.tracker {
    ServiceTracker
}
import org.osgi.service.http {
    HttpService
}
import ceylon.interop.java {
    javaClass
}

class HttpServiceTracker(BundleContext context) 
        extends ServiceTracker(context, javaClass<HttpService>().name, null) {
    
    shared actual Object? addingService(ServiceReference<out Object> reference) {
        assert(is HttpService? httpService = super.addingService(reference));
        if (!exists httpService) {
            return null;
        }
        try {
            print("Registering servlet at /simple");
            httpService.registerServlet("/simple", SimpleServlet(), null, null);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return httpService;
    }
    
    shared actual void removedService(ServiceReference<out Object> reference, Object service) {
        assert(is HttpService httpService = service);
        print("Unregistering /simple");
        httpService.unregister("/simple");
        super.removedService(reference, service);
    }
    
}

shared class Activator() extends DefaultActivator() {
    variable HttpServiceTracker? serviceTracker = null;
    shared actual void start(BundleContext context) {
        super.start(context);
        value tracker = HttpServiceTracker(context);
        tracker.open();
        serviceTracker = tracker;
    }
    shared actual void stop(BundleContext context) {
        super.stop(context);
        print("Stopping server in Ceylon");
        serviceTracker?.close();
        serviceTracker = null;
    }
}

