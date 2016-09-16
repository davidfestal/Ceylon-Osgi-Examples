## Web application with Servlet using Servlet 3.0 annotations

This Ceylon module is also an OSGI bundle that provides:

- a Web application whose sources are located in:

        ./resource/ceylon_osgi_samples/servlets/annotated/ROOT/WEB-INF
        
- a servlet registered automatically through the `WebServlet`annotation.

_Note that the web.xml file is void since the servlet is registered with a 3.0 annotation_

_Note also that there isn't any explicit OSGI dependency in the project_


### How to build

This is a pure Ceylon project that produces a single Ceylon module archive

Simply open it in Eclipse with the [`1.3.0` version of the Ceylon IDE](http://ceylon-lang.org/documentation/1.3/ide/install/)

The generated Ceylon archive is produced here :

`./modules/ceylon_osgi_samples/servlets/annotated/1.0.0/ceylon_osgi_samples.servlets.annotated-1.0.0.car`

### How to test it in Apache Karaf (or JBoss Fuse)

- Start Apache Karaf and ensure the Ceylon distribution and SDK bundles are installed. For this follow the steps described [here](https://github.com/davidfestal/Ceylon-Osgi-Examples#apache-karaf-404-karaf-is-a-part-of-jboss-fuse)

- In the Karaf command line, install the required feature with:

        feature:install http
        feature:install war
        feature:install pax-war

- In the Karaf command line, type:

        bundle:install <file URL of the produced Ceylon archive>
        
- If the bundle installation was successful, the shell outputs the bundle ID:

        Bundle ID: <bundle ID>

- Start the installed bundle with the following command:

        start <bundle ID>

- The servlet should answer at the following URL:
        
        http://localhost:8181/ceylon-servlets/annotated
        
- In the Karaf command line, if you type:

        http:list
        
  our servlet should be listed in the returned list of registered servlets:
 
        `162 |          | ceylonServletWithAnnotation | Deployed    |           | [/ceylon-servlets/annotated]`

- In the Karaf command line, if you type:

        web:list
        
  our web application should be listed in the returned list of registered web applications:
 
        `162 | Active   | Deployed    | 80    | /     | ceylon_osgi_samples.servlets.annotated (1.0.0.v20160219-1532)`
