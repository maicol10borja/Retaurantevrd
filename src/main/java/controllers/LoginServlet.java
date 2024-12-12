package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.LoginService;
import service.LoginServiceSessionImplement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

@WebServlet({"/login", "/login.html"})
public class LoginServlet extends HttpServlet {
    final static String USERNAME = "admin";
    final static String PASSWORD = "12345";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Implementamos objeto de la sesión
        LoginService auth = new LoginServiceSessionImplement();
        // Creamos una variable optional donde guardamos
        // el nombre del usuario obteniéndolo del métodoo getUsername
        Optional<String> usernameOptional = auth.getUsername(req);

        // Si el username está presente quiero que me muestre
        // la información de login exitoso
        if (usernameOptional.isPresent()) {
            resp.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = resp.getWriter()) {
                // Estructura de la respuesta HTML con Bootstrap
                out.print("<!DOCTYPE html>");
                out.println("<html lang='es'>");
                out.println("<head>");
                out.println("<meta charset='utf-8'>");
                out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
                out.println("<title>Bienvenido " + usernameOptional.get() + "</title>");
                out.println("<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' rel='stylesheet'>");
                out.println("<style>");
                out.println("body { background-color: #f8f9fa; }");
                out.println("h1 { margin-top: 50px; }");
                out.println("footer { margin-top: 20px; text-align: center; font-size: 14px; }");
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class='container text-center'>");
                out.println("<div class='alert alert-success' role='alert'>");
                out.println("<h1>Hola " + usernameOptional.get() + ", ya has iniciado sesión anteriormente</h1>");
                out.println("</div>");
                out.println("<p><a href='" + req.getContextPath() + "/index.html' class='btn btn-primary'>Volver al inicio</a></p>");
                out.println("<p><a href='" + req.getContextPath() + "/logout' class='btn btn-danger'>Cerrar sesión</a></p>");
                out.println("</div>");
                out.println("<footer>");
                out.println("<p>© 2024 - Todos los derechos reservados</p>");
                out.println("</footer>");
                out.println("<script src='https://code.jquery.com/jquery-3.5.1.slim.min.js'></script>");
                out.println("<script src='https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js'></script>");
                out.println("<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>");
                out.println("</body>");
                out.println("</html>");
            }
        } else {
            // Si no está autenticado, redirige a la página de login
            getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (USERNAME.equals(username) && PASSWORD.equals(password)) {
            // Crear la sesión y redirigir a la página de login
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            resp.sendRedirect(req.getContextPath() + "/login.html");
        } else {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Lo sentimos no está autorizado para ingresar a esta página.");
        }
    }
}