Using Ceylon modules as OSGI bundles in various contexts
========================================================

These example projects show how Ceylon modules can be installed and used as pure OSGI bundles.
This provides a great opportunity to run Ceylon code inside a growing number of JEE application servers or enterprise containers that are base upon (or integrated with) OSGI.

## Requirements common to all the examples

In order to be able to resolve and start Ceylon module archives (`.car` files) inside an OSGI container, you will first need to install, in the OSGI container, all the bundles of the Ceylon distribution and SDK.

#### Retrieving the Ceylon Distribution and SDK for OSGI 

These bundles are available in a dedicated place on the Ceylon language web site :

- as OBR bundle repositories:
    - Old-style OBR syntax (still used by Apache Felix):
        
        https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/repository.xml

        https://downloads.ceylon-lang.org/osgi/sdk/1.2.1/repository.xml

    - New standard R5 OBR syntax:
        
        https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/index.xml

        https://downloads.ceylon-lang.org/osgi/sdk/1.2.1/index.xml

- as P2 repositories for Eclipse development :
  
  https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/
  
  https://downloads.ceylon-lang.org/osgi/sdk/1.2.1/

- as Zip archives for direct deployment inside containers :
  
  https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/ceylon.distribution.osgi.bundles-1.2.1.zip

  https://downloads.ceylon-lang.org/osgi/sdk/1.2.1/ceylon.sdk.osgi.bundles-1.2.1.zip

- as Zip archives for direct deployment inside containers :
  
  https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/ceylon.distribution.osgi.bundles-1.2.1.zip

  https://downloads.ceylon-lang.org/osgi/sdk/1.2.1/ceylon.sdk.osgi.bundles-1.2.1.zip

- as Apache Karaf features (see http://karaf.apache.org/manual/latest/users-guide/provisioning.html):
    - `ceylon.distribution.runtime`, available in the following feature repository
    
        https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/karaf-features.xml
    
    - `ceylon.sdk`, available in the following feature repository
      
        https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/karaf-features.xml


#### Installing the Ceylon Distribution and SDK in an OSGI container

##### Glassfish v4.1:

- Let's assume we start with a fresh installation of Glassfish v4.1

- Unzip the 2 zip archives mentioned earlier ([distribution](https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/ceylon.distribution.osgi.bundles-1.2.1.zip) and [sdk](https://downloads.ceylon-lang.org/osgi/sdk/1.2.1/ceylon.sdk.osgi.bundles-1.2.1.zip)) into :

  `../glassfish4/glassfish/domains/domain1/autodeploy/bundles`
  
- start the glassfish server :

  `../glassfish4/bin/asadmin start-domain`

- verify that the various Ceylon bundles were deployed correctly in the following log file :

  `../glassfish4/glassfish/domains/domain1/logs`

##### Apache Felix 5.4.0:

- Let's assume we start with a fresh installation of Apache Felix v5.4.0 (`org.apache.felix.main.distribution-5.4.0.zip`)

- In the `conf/config.properties` file of the Felix installation directory, find the `obr.repository.url` property.

- Uncomment this property if necessary

- Add the 2 Ceylon following OBR urls at the end of this property (space-separated):
 
        https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/repository.xml https://downloads.ceylon-lang.org/osgi/sdk/1.2.1/repository.xml

- From the Felix installationdirectory, Start Felix with the following command:

        java -jar bin/felix.jar

- From the Felix Gogo shell, deploy the Ceylon Distribution with:
      
        obr:deploy "Ceylon Distribution Bundle"

- Deploy any SDK module you need with the following command:
      
        obr:deploy ceylon.file

##### Apache Karaf 4.0.4 (Karaf is a part of JBoss Fuse):

- Let's assume we start with a fresh installation of Apache Karaf v4.0.4 (`apache-karaf-4.0.4.zip`)

- In the karaf installation directory, start Karaf with the following command:

        ./bin/karaf

- In the karaf shell, add the Ceylon distribution feature repository with the following command:

        feature:repo-add https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/karaf-features.xml

- In the karaf shell, add the Ceylon SDK feature repository with the following command:

        feature:repo-add https://downloads.ceylon-lang.org/osgi/sdk/1.2.1/karaf-features.xml

- In the karaf shell, install the Ceylon distribution feature with the following command:

        feature:install ceylon.distribution.runtime

- In the karaf shell, install the Ceylon SDK feature with the following command:

        feature:install ceylon.sdk

