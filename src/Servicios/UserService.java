package Servicios;

import Dominio.Localidad;
import Dominio.Provincia;
import Dominio.TipoUsuario;
import Dominio.Usuario;

import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

public class UserService extends DBService {
    private static final String tabla = "usuarios";

    public static ArrayList<Usuario> obtenerUsuarios(Integer tipo)
    {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        try {
            String query ="select *,p.nombre As provincia , l.nombre As localidad from %s.%s As u " +
                    "inner join provincias As p on p.id = u.idProvincia " +
                    "inner join localidades As l on l.id = u.idLocalidad " +
                    "where u.estado='A' and u.idTipoUsuario = %d";
            query = String.format(query,database,tabla, tipo);
            ResultSet rs = execSelect(query);
            while(rs.next())
            {
                Usuario usuario = new Usuario();
                usuario.setLegajo(rs.getInt("legajo"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setEmail(rs.getString("email"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setDni(rs.getInt("dni"));
                usuario.setFechaNac(rs.getString("fechaNac"));
                usuario.setLocalidad(new Localidad(rs.getInt("idLocalidad"), rs.getString("localidad")));
                usuario.setProvincia(new Provincia(rs.getInt("idProvincia"), rs.getString("provincia")));
                usuario.setTelefono(rs.getString("telefono"));
                usuarios.add(usuario);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    public static void agregar(Usuario usuario)
    {
        try {
            String query ="insert into %s.%s (dni, nombre, apellido, direccion, idLocalidad, " +
                        "idProvincia, email, telefono, pass, fechaRegistro, fechaNac, idTipoUsuario) " +
                    "VALUES (%d,'%s','%s','%s',%d,%d,'%s','%s',MD5('%s'),CURRENT_DATE(),'%s',%d)";
            query=String.format(query,database, tabla, usuario.getDni(),usuario.getNombre(),usuario.getApellido(),
                    usuario.getDireccion(),usuario.getLocalidad().getId(), usuario.getProvincia().getId(),
                    usuario.getEmail(),usuario.getTelefono(),usuario.getDni(),usuario.getFechaNac(),
                    usuario.getTipoUsuario().getId());

            execInsert(query);


        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static final void baja(Integer legajo, Integer idTipoUsuario) {
        try {
            String query = "UPDATE %s.%s SET estado = 'B' WHERE legajo = %d AND idTipoUsuario = %d";
            query = String.format(query, database, tabla, legajo, idTipoUsuario);
            DBService.execUpdate(query);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static final Usuario usuarioLegajo(Integer legajo, Integer tipo) {
        Usuario user = new Usuario();

        try {
            String query = "SELECT * FROM %s.%s WHERE estado = 'A' AND idTipoUsuario = %d AND legajo = %d";
            query = String.format(query, database, tabla, tipo,legajo );
            ResultSet rs = execSelect(query);
            rs.next();
            user.setDireccion(rs.getString("direccion"));
            user.setFechaNac(rs.getString("fechaNac"));
            user.setLegajo(legajo);
            user.setEmail(rs.getString("email"));
            user.setNombre(rs.getString("nombre"));
            user.setApellido(rs.getString("apellido"));
            user.setTelefono(rs.getString("telefono"));
            user.setDni(rs.getInt("dni"));
            user.setTipoUsuario(new TipoUsuario(tipo));
            user.setLocalidad(new Localidad(rs.getInt("idLocalidad")));
            user.setProvincia(new Provincia(rs.getInt("idProvincia")));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    public static final void modificar(Usuario usuario) {
        try {
            String query = "UPDATE %s.%s SET " +
                    "dni = %d, nombre = %s, apellido = %s, fechaNac = %s, direccion = %s, idLocalidad = %d, idProvincia = %d, " +
                    "email = %s, telefono = %s WHERE legajo = %d AND idTipoUsuario = %d";

            query = String.format(query, database, tabla, usuario.getDni(), comillas(usuario.getNombre().trim()),
                    comillas(usuario.getApellido().trim()), comillas(usuario.getFechaNac().trim()),
                    comillas(usuario.getDireccion().trim()), usuario.getLocalidad().getId(), usuario.getProvincia().getId(),
                    comillas(usuario.getEmail().trim()), comillas(usuario.getTelefono().trim()), usuario.getLegajo(),
                    usuario.getTipoUsuario().getId());

            DBService.execUpdate(query);
        } catch (SQLIntegrityConstraintViolationException e) {
            if (e.getMessage().contains("email"))
                usuario.setErrorKey(1);
            if (e.getMessage().contains("dni"))
                usuario.setErrorKey(2);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}
