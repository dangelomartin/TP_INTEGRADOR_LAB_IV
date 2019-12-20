package Servicios;

import Dominio.Materia;

import java.sql.ResultSet;
import java.util.ArrayList;

public class MateriaService extends DBService {
    private static final String tabla = "materias";

    public static final ArrayList<Materia> list() {
        ArrayList<Materia> materias = new ArrayList<>();

        try {
            String query = "SELECT * FROM %s.%s";
            query = String.format(query, database, tabla);
            ResultSet rs = execSelect(query);
            while (rs.next()) {
                Materia materia = new Materia(rs.getInt("id"), rs.getString("nombre"));
                materia.setEstado(rs.getString("estado"));
                materias.add(materia);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return materias;
    }
}
