Using Ceylon modules as OSGI bundles in various contexts
========================================================

These example projects show how Ceylon modules can be installed and used as pure OSGI bundles.
This provides a great opportunity to run Ceylon code inside a growing number of JEE application servers or enterprise containers that are base upon (or integrated with) OSGI.

## Requirements common to all the examples

In order to be able to resolve and start Ceylon module archives (`.car` files) inside an OSGI container, you will first need to install, in the OSGI container, all the bundles of the Ceylon distribution and SDK.

#### Retrieving the Ceylon Distribution and SDK for OSGI 

These bundles are available in a dedicated place on the Ceylon language web site :

- as OBR bundle repositories (be careful - they require the `osgi.ee` capability, so you might encounter [this bug](https://issues.apache.org/jira/browse/FELIX-4640)) : 
  
  http://downloads.ceylon-lang.org/osgi/1.1.0/distrib/repository.

  http://downloads.ceylon-lang.org/osgi/1.1.0/sdk/repository.xml

- as P2 repositories for Eclipse development :
  
  http://downloads.ceylon-lang.org/osgi/1.1.0/distrib

  http://downloads.ceylon-lang.org/osgi/1.1.0/sdk

- as Zip archives for direct deployment inside containers :
  
  http://downloads.ceylon-lang.org/osgi/1.1.0/distrib/ceylon.distribution.osgi.bundles-1.1.0.zip

  http://downloads.ceylon-lang.org/osgi/1.1.0/sdk/ceylon.sdk.osgi.bundles-1.1.0.zip

#### Installing the Ceylon Distribution and SDK for OSGI

For example, for Glassfish v4.1, that is based on OSGI, deploying the Ceylon distribution and SDK to test these examples is **_very_** simple :

- let's assume we start with a fresh installation of Glassfish v4.1

- just unzip the 2 zip archives mentionned earlier into :

  `../glassfish4/glassfish/domains/domain1/autodeploy/bundles`

- start the glassfish server :

  `../glassfish4/bin/asadmin start-domain`

- verify that the various Ceylon bundles were deployed correctly in the following log file :

  `../glassfish4/glassfish/domains/domain1/logs`


## Ceylon in a Web Application Bundle

A web application bundle can be _just_ a JEE web application in which you add a Manifest with OSGI headers to descrbe its bundle name, its requirements, dependencies, etc ...

##### htmlGreeter

The **htmlGreeter** project is pure Ceyon project with a top-level function that takes a name, a locale code, and return a greeting in Html. It uses the `ceylon.time`, `ceylon.locale` and `ceylon.html` SDK modules.

Simply open it in Eclipse with the [1.1.0 version of the Ceylon IDE](http://ceylon-lang.org/documentation/1.1/ide/install/)

The generated Ceylon archive is in :

`./htmlGreeter/modules/htmlGreeter/1.0.0/htmlGreeter.car`

##### ceylonInWebApplicationBundle

The **ceylonInWebApplicationBundle** project is a Wep appliction project that you can open in Eclipse (just check that you have the web and JEE tools plugins installed).

Since it depends on **htmlGreeter**, you should open both in the same workspace. You might still see an error if the generated module archive of **htmlGreeter** is not found : just clean build **htmlGreeter** and it will disappear.

To generate the web application archive, just use the `Export -> Web -> War File` eclipse command.

##### Installation

Now deploy both archives with the Glassfish command line :

```
~/glassfish4/bin$ ./asadmin deploy --type osgi ~/git/Ceylon-Osgi-Examples/htmlGreeter/modules/htmlGreeter/1.0.0/htmlGreeter-1.0.0.car

Application deployed with name htmlGreeter-1.0.0.
Command deploy executed successfully.

~/glassfish4/bin$ ./asadmin deploy --type war ~/git/Ceylon-Osgi-Examples/ceylonInWebApplicationBundle/ceylonInWebApplicationBundle.war 

Application deployed with name ceylonInWebApplicationBundle.
Command deploy executed successfully.

```

##### Running the web application

Point your browser to :


http://localhost:8080/ceylonInWebApplicationBundle/SayHelloFromCeylonServlet?name=You


And you should get a web page greeting *You* with the current time formatted according to the browser locale.

