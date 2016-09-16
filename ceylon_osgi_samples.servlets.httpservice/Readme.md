## Simple Servlet with standard HttpService

This Ceylon module is also an OSGI bundle that provides a simple servlet, registered at startup in the standard OSGI HTTP service.

It also shows how to explicitly define a bundle activator.

### How to build

This is a pure Ceylon project that produces a single Ceylon module archive

Simply open it in Eclipse with the [1.3 version of the Ceylon IDE](http://ceylon-lang.org/documentation/1.3/ide/install/)

The generated Ceylon archive is produced here :

`./modules/ceylon_osgi_samples/servlets/httpservice/1.0.0/ceylon_osgi_samples.servlets.httpservice-1.0.0.car`

### How to test it in Apache Karaf (or JBoss Fuse)

- Start Apache Karaf and ensure the Ceylon distribution and SDK bundles are installed. For this follow the steps described [here](https://github.com/davidfestal/Ceylon-Osgi-Examples#apache-karaf-404-karaf-is-a-part-of-jboss-fuse)

- In the Karaf command line, install the following `http` feature with:

        feature:install http

- In the Karaf command line, type:

        bundle:install <file URL of the produced Ceylon archive>
        
- If the bundle installation was successful, the shell outputs the bundle ID:

        Bundle ID: <bundle ID>

- Start the installed bundle with the following command:

        start <bundle ID>

- The servlet should answer at the following URL:
        
        http://localhost:8181/ceylon-servlets/httpservice

- In the Karaf command line, if you type:

        http:list
        
  our servlet should be listed in the returned list of registered servlets:
 
        `163 | SimpleServlet   | ServletModel-26     | Deployed  | /ceylon-servlets/httpservice | [/ceylon-servlets/httpservice/*]`
