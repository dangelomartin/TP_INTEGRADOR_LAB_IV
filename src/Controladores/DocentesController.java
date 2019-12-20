package Controladores;


import Dominio.Docente;
import Dominio.Localidad;
import Dominio.Provincia;
import Servicios.UserService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/docentes/*")
public class DocentesController extends UsuarioController {

    private void setContext() {
        this.path = "Docentes";
        this.tipo = "profesor";
        this.navbarTitle = "Profesores";
        this.Usuario = new Docente();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){
        try {
            this.get(req, 2);
            req.getRequestDispatcher("/ListDocentes.jsp").forward(req, resp);
        }catch(Exception e){
            e.printStackTrace();
            redireccionar(req,resp, "login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){
        if(req.getParameter("accion").equals("editar"))
        {
            this.doPut(req,resp);
            return;
        }

        try {
            Docente docente = new Docente();
            establecerUsuario(req, docente);
            UserService.agregar(docente);
            redireccionar(req,resp,"AltaDocente.jsp");

        }catch(Exception e){
            e.printStackTrace();
            redireccionar(req,resp, "login");
        }

    }

    private void establecerUsuario(HttpServletRequest req, Docente docente) {
        docente.setDni(Integer.parseInt(req.getParameter("dni")));
        docente.setNombre(req.getParameter("nombre"));
        docente.setApellido(req.getParameter("apellido"));
        docente.setFechaNac(req.getParameter("fechanac"));
        docente.setDireccion(req.getParameter("direccion"));
        docente.setLocalidad(new Localidad(Integer.parseInt(req.getParameter("localidad"))));
        docente.setProvincia(new Provincia(Integer.parseInt(req.getParameter("provincia"))));
        docente.setEmail(req.getParameter("email"));
        docente.setTelefono(req.getParameter("telefono"));
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
    {
        try {
            Docente docente = new Docente();
            docente.setLegajo(Integer.parseInt(req.getParameter("legajo")));
            establecerUsuario(req, docente);
            UserService.modificar(docente);
            redireccionar(req,resp,"/docentes");

        }catch(Exception e){
            e.printStackTrace();
            redireccionar(req,resp, "login");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) {
        try{
            this.setContext();
            this.eliminar(req, resp);
            resp.setContentType("application/json");
            resp.getWriter().print("{\"status\": 200}");
            //return null;
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
