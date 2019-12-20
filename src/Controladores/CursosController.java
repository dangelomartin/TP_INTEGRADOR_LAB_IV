package Controladores;


import Dominio.*;
import Servicios.AlumnosPorCursosService;
import Servicios.CursosService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cursos/*")
public class CursosController extends Controlador {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        validarSesion(req,resp);
        try {
            req.setAttribute("cursos", CursosService.obtenerCursos((Integer)req.getSession().getAttribute("legajo"),(Integer)req.getSession().getAttribute("idTipoUsuario")));
            req.getRequestDispatcher("/Cursos.jsp").forward(req, resp);
        }catch(Exception e){
            e.printStackTrace();
            redireccionar(req,resp, "login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("accion").equals("cargar"))
        {
            this.doPut(req,resp);
            return;
        }

        try{
            Curso curso = new Curso();
            curso.setSemestre(Integer.parseInt(req.getParameter("semestre")));
            curso.setMateria(new Materia(Integer.parseInt(req.getParameter("materia"))));
            curso.setDocente(new Docente(Integer.parseInt(req.getParameter("docente[]"))));
            for (String legajo: req.getParameterValues("alumnos[]")) {
                curso.agregarAlumno(Integer.parseInt(legajo));
            }
            CursosService.add(curso);
            AlumnosPorCursosService.agregarAlumnos(curso);
            redireccionar(req,resp, "cursos");

        }catch(Exception e){
            e.printStackTrace();
            redireccionar(req,resp, "login");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            for (String legajoAlumno: req.getParameterValues("alumnos[]")) {
                AlumnosPorCurso alumno = new AlumnosPorCurso();
                alumno.setAlumno(new Alumno(Integer.parseInt(legajoAlumno)));
                alumno.setCurso(new Curso(Integer.parseInt(req.getParameter("idCurso"))));
                alumno.setP1(Integer.parseInt(req.getParameter("P1-"+legajoAlumno)));
                alumno.setP2(Integer.parseInt(req.getParameter("P2-"+legajoAlumno)));
                alumno.setR1(Integer.parseInt(req.getParameter("R1-"+legajoAlumno)));
                alumno.setR2(Integer.parseInt(req.getParameter("R2-"+legajoAlumno)));
                alumno.setCondicion(req.getParameter("condicion-"+legajoAlumno));
                AlumnosPorCursosService.modificar(alumno);
            }
            redireccionar(req,resp,"cursos");
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
