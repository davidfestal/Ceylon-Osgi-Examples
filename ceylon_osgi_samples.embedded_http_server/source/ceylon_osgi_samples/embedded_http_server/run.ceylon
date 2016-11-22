import ceylon.http.server { Server,
    newServer,
    startsWith,
    Request,
    Response,
    Endpoint }
import org.osgi.framework {
    BundleContext
}
import com.redhat.ceylon.dist.osgi {
    DefaultActivator=Activator
}
import ceylon.io {
    SocketAddress
}

Server server = newServer { 
    //an endpoint, on the path /hello
    Endpoint {
        path = startsWith("/hello");
        //handle requests to this path
        service(Request request, Response response) 
                => response.writeString("hello world");
    }
};

shared class Activator() extends DefaultActivator() {
    shared actual void start(BundleContext context) {
        super.start(context);
        server.startInBackground(SocketAddress("127.0.0.1",9999));
    }
    shared actual void stop(BundleContext context) {
        server.stop();
        super.stop(context);
    }
}
