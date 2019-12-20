package Servicios;

import Dominio.Curso;
import Dominio.Docente;
import Dominio.Materia;

import java.sql.ResultSet;
import java.util.ArrayList;

public class CursosService  extends DBService {
    private static final String tabla = "cursos";

    public static final ArrayList<Curso> obtenerCursos(Integer legajo, Integer tipo) {
        ArrayList<Curso> cursos = new ArrayList<>();

        try {
            String isTeacher = tipo == 2 ? (" AND C.legajoDocente = " + legajo) : "";
            String query = "SELECT C.*, M.nombre AS nombreMateria, U.nombre AS nombreDocente, U.apellido AS apellidoDocente " +
                    "FROM %s.%s C " +
                    "INNER JOIN %s.materias M ON C.idMateria = M.id " +
                    "INNER JOIN %s.usuarios U ON C.legajoDocente = U.legajo " +
                    "WHERE C.estado = 'A' AND U.idTipoUsuario = 2" + isTeacher + " " +
                    "ORDER BY C.ano, C.semestre, C.idMateria";
            query = String.format(query, database, tabla, database, database);
            ResultSet rs = execSelect(query);
            while (rs.next()) {
                Curso curso = new Curso();
                curso.setId(rs.getInt("id"));
                curso.setMateria(new Materia(rs.getInt("idMateria"), rs.getString("nombreMateria")));
                curso.setSemestre(rs.getInt("semestre"));
                curso.setAno(rs.getInt("ano"));
                curso.setDocente(new Docente(rs.getInt("legajoDocente"),
                        rs.getString("nombreDocente"),
                        rs.getString("apellidoDocente")));
                cursos.add(curso);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cursos;
    }

    public static final void add(Curso curso) {
        try {
            String query = "INSERT INTO " + database + "." + tabla + " (idMateria, semestre, legajoDocente, ano) VALUES(%d, %d, %d, YEAR(NOW()));";

            query = String.format(query, curso.getMateria().getId(), curso.getSemestre(), curso.getDocente().getLegajo());

            curso.setId(DBService.execInsert(query, 1));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
