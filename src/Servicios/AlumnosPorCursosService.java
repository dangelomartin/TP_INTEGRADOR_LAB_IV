package Servicios;

import Dominio.Alumno;
import Dominio.AlumnosPorCurso;
import Dominio.Curso;

import java.sql.ResultSet;
import java.util.ArrayList;


public class AlumnosPorCursosService extends  DBService{

    public static void agregarAlumnos(Curso curso)
    {
        try{
            StringBuilder alumnosPorCurso = new StringBuilder();
            for (Alumno alumno : curso.getAlumnos())
                alumnosPorCurso.append("(" + curso.getId() + ", " + alumno.getLegajo() +"), ");

            String alumnos = alumnosPorCurso.substring(0, alumnosPorCurso.length() - 2);

            String query = "INSERT INTO %s.%s (idCurso, legajoAlumno) VALUES " + alumnos + ";";

            query = String.format(query, database, "alumnosxcurso");

            DBService.execInsert(query);

        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static final ArrayList<AlumnosPorCurso> obtenerAlumnos(Integer materia) {
        ArrayList<AlumnosPorCurso> alumnosPorCursos = new ArrayList<>();

        try {
//            String isTeacher = tipo == 2 ? (" AND C.legajoDocente = " + legajo) : "";
            String query = "select A.*, u.nombre as nombre, u.apellido as apellido from %s.%s as A " +
                    "inner join usuarios u on A.legajoAlumno = u.legajo " +
                    "where A.idCurso = %d" ;

            query = String.format(query, database, "alumnosxcurso", materia);
            ResultSet rs = execSelect(query);
            while (rs.next()) {
                AlumnosPorCurso alumnoDelCurso = new AlumnosPorCurso();
                alumnoDelCurso.setAlumno(new Alumno(rs.getInt("legajoAlumno"),
                        rs.getString("nombre"), rs.getString("apellido")));
                alumnoDelCurso.setP1(rs.getInt("notaP1"));
                alumnoDelCurso.setP2(rs.getInt("notaP2"));
                alumnoDelCurso.setR1(rs.getInt("notaR1"));
                alumnoDelCurso.setR2(rs.getInt("notaR2"));
                alumnoDelCurso.setCondicion(rs.getString("Condicion"));
                alumnosPorCursos.add(alumnoDelCurso);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return alumnosPorCursos;
    }

    public static final void modificar(AlumnosPorCurso alumnosPorCurso) {
        try {
            String query = "UPDATE %s.%s SET " +
                    "notaP1 = %d, notaP2 = %d, notaR1 = %d, notaR2 = %d ,Condicion = %s " +
                    "where idCurso=%d AND legajoAlumno=%d";

            query = String.format(query,database,"alumnosxcurso", alumnosPorCurso.getP1(), alumnosPorCurso.getP2(),
                    alumnosPorCurso.getR1(), alumnosPorCurso.getR2(),comillas(alumnosPorCurso.getCondicion()),
                    alumnosPorCurso.getCurso().getId(), alumnosPorCurso.getAlumno().getLegajo());


            DBService.execUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
