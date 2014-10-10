package ceylonInWebApplicationBundle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SayHelloFromCeylonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SayHelloFromCeylonServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        callCeylon(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        callCeylon(request, response);
    }

    private void callCeylon(HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        response.getWriter().write(htmlGreeter.sayHelloInCeylon_.sayHelloInCeylon(name, request.getLocale().toLanguageTag()));
    }
}
