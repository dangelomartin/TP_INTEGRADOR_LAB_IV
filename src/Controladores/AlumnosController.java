package Controladores;

import Dominio.Alumno;
import Dominio.Localidad;
import Dominio.Provincia;
import Servicios.UserService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/alumnos/*")
public class AlumnosController extends UsuarioController {

    private void setContext() {
        this.path = "Alumno";
        this.tipo = "alumno";
        this.navbarTitle = "Alumnos";
        this.Usuario = new Alumno();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {

            this.get(req, 3);
            req.getRequestDispatcher("/ListAlumnos.jsp").forward(req, resp);
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
            Alumno alumno = new Alumno();
            establecerUsuario(req, alumno);
            UserService.agregar(alumno);
            redireccionar(req,resp,"AltaAlumno.jsp");

        }catch(Exception e){
            e.printStackTrace();
            redireccionar(req,resp, "login");
        }

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
    {
        try {
            Alumno alumno = new Alumno();
            alumno.setLegajo(Integer.parseInt(req.getParameter("legajo")));
            establecerUsuario(req, alumno);
            UserService.modificar(alumno);
            redireccionar(req,resp,"/alumnos");

        }catch(Exception e){
            e.printStackTrace();
            redireccionar(req,resp, "login");
        }
    }

    private void establecerUsuario(HttpServletRequest req, Alumno alumno) {
        alumno.setDni(Integer.parseInt(req.getParameter("dni")));
        alumno.setNombre(req.getParameter("nombre"));
        alumno.setApellido(req.getParameter("apellido"));
        alumno.setFechaNac(req.getParameter("fechanac"));
        alumno.setDireccion(req.getParameter("direccion"));
        alumno.setLocalidad(new Localidad(Integer.parseInt(req.getParameter("localidad"))));
        alumno.setProvincia(new Provincia(Integer.parseInt(req.getParameter("provincia"))));
        alumno.setEmail(req.getParameter("email"));
        alumno.setTelefono(req.getParameter("telefono"));
    }


    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) {
        try{
            this.setContext();
            this.eliminar(req, resp);
            resp.setContentType("application/json");
            resp.getWriter().print("{\"status\": 200}");

        }catch (Exception e){
            e.printStackTrace();
        }
    }



}
