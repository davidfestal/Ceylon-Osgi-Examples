import ceylon.html {
    Html,
    Doctype { html5 },
    H2,
    Body,
    H1,
    Head,
    Div,
    Ul,
    Li,
    Pre,
    P,
    A,
    Title
}
import ceylon.locale {
    locale
}
import ceylon.time {
    now
}
import ceylon.time.timezone {
    timeZone
}

import javax.servlet.annotation {
    webServlet
}
import javax.servlet.http {
    HttpServlet,
    HttpServletRequest,
    HttpServletResponse
}

webServlet {
    name = "ceylonServletWithAnnotation";
    urlPatterns = {"/ceylon-servlets/annotated"};
}
shared class SimpleServlet()
        extends HttpServlet() {
    shared actual void doGet(HttpServletRequest req, HttpServletResponse resp) {
        Object o = [req];
        if (is {HttpServletRequest*} o) {
            print(`module`.name);
        }
        resp.contentType = "text/html";
        resp.writer.write(Html {
            doctype = html5;
            Head {
                Title { "Ceylon-OSGI Examples - Servlet 3.0 annotations" }
            },
            Body {
                Div {
                    style = "text-align: center";
                    H1 { "Hello `` req.getParameter("name") else "Anybody" `` from Ceylon code" },
                    H2 {
                        "It's time to discover Ceylon-OSGI interoperability : `` 
                        locale(req.locale.toLanguageTag() else "en_US")
                                ?.formats?.longFormatTime(
                            now().time(), timeZone.system) 
                        else "" ``";
                    }
                },
                Div {
                    style = "margin:auto; width:50%";
                    "This Ceylon module is also an OSGI bundle that provides:",
                    Ul {
                        Li {
                            "a Web application whose sources are located in ",
                            Pre { "resource/ceylon_osgi_samples/servlets/annotated/ROOT/WEB-INF" }
                        },
                        Li {
                            "a servlet registered automatically through the Servlet 3.0 ",
                            Pre { "webServlet" },
                            " annotation."
                        }
                    },
                    P {
                        "Note that the web.xml file is void since the servlet is registered with a 3.0 annotation"
                    },
                    "This example runs in Apache Karaf with the following features:",
                    Ul {
                        Li {
                            A { href="ceylon.distribution.runtime"; "https://downloads.ceylon-lang.org/osgi/distribution/1.2.1/karaf-features.xml" }
                        },
                        Li { 
                            A { href="ceylon.sdk"; "https://downloads.ceylon-lang.org/osgi/sdk/1.2.1/karaf-features.xml" }
                        },
                        Li { "http" },
                        Li { "war" },
                        Li { "pax-war" }
                    }
                }
            }
        }.string);
    }
}
