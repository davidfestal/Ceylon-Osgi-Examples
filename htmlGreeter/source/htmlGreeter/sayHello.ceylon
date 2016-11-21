import ceylon.html {
    Doctype { html5 },
	...
}
import ceylon.time {
    now
}
import ceylon.locale {
    locale
}
import ceylon.time.timezone {
    timeZone
}

shared String sayHelloInCeylon(String? name, String? browserLocale) {
    return Html {
        doctype = html5;
        Head {
            title = "Example of a Web Application Bundle using a Ceylon module";
        },
        Body {
           Div {
               style = "text-align: center";
               H1 { "Hello `` name else "Anybody" `` from Ceylon code" },
               Br(),
               H2 { "It's `` locale(browserLocale?.string else "en_US")?.formats?.longFormatTime(now().time(), timeZone.system) else "" ``" }
           }
        }
    }.string;
}