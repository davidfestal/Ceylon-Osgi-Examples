import ceylon.html {
    ...
}
import java.lang {
    JString = String
}
import ceylon.interop.java {
    javaString
}
import ceylon.time {
    now
}
import ceylon.locale {
    locale
}

shared JString sayHelloInCeylon(JString? name, JString? browserLocale) {
    return javaString {
        Html {
            doctype = html5;
            head = Head {
                title = "Example of a Web Application Bundle using a Ceylon module";
            };
            body = Body {
               Div {
                   style = "text-align: center";
                   H1 {
                       text = "Hello `` name else "Anybody" `` from Ceylon code";
                   },
                   Br(),
                   H2 {
                       text = "It's `` locale(browserLocale?.string else "en_US")?.formats?.longFormatTime(now().time()) else "" ``";
                   }
               }
            };
        }.string;
    };
}