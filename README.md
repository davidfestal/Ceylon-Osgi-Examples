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


