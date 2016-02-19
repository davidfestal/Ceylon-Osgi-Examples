## Ceylon in a Web Application Bundle

A web application bundle can be _just_ a JEE web application in which you add a Manifest with OSGI headers to descrbe its bundle name, its requirements, dependencies, etc ...

### htmlGreeter (sibling project)

The **htmlGreeter** project is pure Ceyon project with a top-level function that takes a name, a locale code, and return a greeting in Html. It uses the `ceylon.time`, `ceylon.locale` and `ceylon.html` SDK modules.

Simply open it in Eclipse with the [1.1.0 version of the Ceylon IDE](http://ceylon-lang.org/documentation/1.1/ide/install/)

The generated Ceylon archive is in :

`./htmlGreeter/modules/htmlGreeter/1.0.0/htmlGreeter.car`

###### Important note :

As you can see in the `Java Build Path` project properties page, in the `Order and Export` tab, the `Ceylon Language Module`and `Ceylon Project Modules` classpath container entries have been exported (which is _not_ the case by default): so any pure Java project depending on **htmlGreeter** will itself have access to the Ceylon class definitions used by **htmlGreeter**.


### ceylonInWebApplicationBundle

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

