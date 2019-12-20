package Controladores;

import Dominio.Usuario;
import Servicios.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

abstract public class UsuarioController extends Controlador{
    protected Usuario usuario = null;
    protected String path = null;
    protected String tipo = null;
    protected String navbarTitle = null;


    protected void get (HttpServletRequest req,Integer tipoUsuario)
    {
        ArrayList <Usuario> usuarios = UserService.obtenerUsuarios(tipoUsuario);
        req.setAttribute("usuarios",usuarios);

    }

    public final void eliminar(HttpServletRequest req, HttpServletResponse resp) {
        try {
            UserService.baja(Integer.parseInt(req.getParameter("legajo")),
                    this.Usuario.getTipoUsuario().getId());
            //return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
