"Generated module descriptor with all the Eclipse
 dependencies that are required by the Ceylon build.
 This file is generated from :
 - the template file found in `source-templates/module.ceylon`
 - the list of imports containing all the `org.eclipse.*` OSGI bundles
 mentionned in :
     - the `META-INF/MANIFEST.MF` file (in the `Require-Bundle` and
     `Import-Package` headers)
     - the `AdditionalBundles.properties` file"
native("jvm") module eclipseDependencies.myMainModule "1.0.0" {
/* ADD GENERATED IMPORTS HERE */}