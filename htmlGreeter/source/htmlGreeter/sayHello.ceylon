import ceylon.html {
    ...
}
import ceylon.time {
    now
}
import ceylon.locale {
    locale
}

shared String sayHelloInCeylon(String? name, String? browserLocale) {
    return Html {
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
}