native("jvm") module ceylon_osgi_samples.servlets.httpservice "1.0.0" {
    shared import com.redhat.ceylon.dist "1.3.1";
    import java.base "7";
    import ceylon.interop.java "1.3.1";
    import ceylon.collection "1.3.1";
    import ceylon.html "1.3.1";
    import ceylon.locale "1.3.1";
    import org.osgi.core "4.3.1";
    shared import javax.servlet "3.1.0";
    import maven:"org.osgi:osgi_R4_compendium" "1.0";
}
