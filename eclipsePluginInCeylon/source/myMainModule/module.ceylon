native("jvm") module myMainModule "1.0.0" {
    shared import java.base "7";
    shared import eclipseDependencies.myMainModule "1.0.0";
    shared import ceylon.collection "1.2.1";
}
