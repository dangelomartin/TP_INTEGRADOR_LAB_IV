package Controladores;

import Servicios.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login/*")
public class LoginController extends Controlador {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();
        req.getRequestDispatcher("/Login.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        try {
            String email = req.getParameter("email");
            String pass = req.getParameter("pass");
            LoginService.ValidarUsuario(email, pass);
            LoginService.Autenticar(email, req);
            redireccionar(req, resp, "estadisticas");

        } catch (Exception e) {
            redireccionar(req, resp, "login");

        }
    }


}
