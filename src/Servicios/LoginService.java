package Servicios;

import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginService extends DBService {
    private static String tabla = "usuarios";

    public static void ValidarUsuario(String email, String pass) throws Exception {
        String query = "select COUNT(*) as existe from %s.%s where email='%s' and pass=MD5('%s')";
        query = String.format(query, database, tabla, email, pass);
        ResultSet rs = execSelect(query);
        rs.next();
        Boolean existe = rs.getBoolean("existe");
        if (!existe) throw new Exception("Usuario invalido forro");
    }

    public static void Autenticar(String email, HttpServletRequest req) throws SQLException {
        String query = "select Legajo, idTipoUsuario,	nombre, apellido from %s.%s where Email='%s'";
        query = String.format(query, database, tabla, email);
        ResultSet rs = execSelect(query);
        rs.next();
        req.getSession().setAttribute("email", email);
        req.getSession().setAttribute("legajo", rs.getInt("Legajo"));
        req.getSession().setAttribute("idTipoUsuario", rs.getInt("idTipoUsuario"));
        req.getSession().setAttribute("nombre", rs.getString("nombre"));
        req.getSession().setAttribute("apellido", rs.getString("apellido"));


    }

}
