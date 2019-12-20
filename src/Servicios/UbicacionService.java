package Servicios;

import Dominio.Localidad;
import Dominio.Provincia;

import java.sql.ResultSet;
import java.util.ArrayList;

public class UbicacionService extends DBService {

    public static ArrayList<Provincia> obtenerProvincias()
    {
        ArrayList<Provincia> provincias = new ArrayList<>();
        try{
            String query = "select * from %s.%s  where estado='A'";
            query=String.format(query,database,"provincias");
            ResultSet rs = execSelect(query);
            while (rs.next())
                provincias.add(new Provincia(rs.getInt("id"),rs.getString("nombre")));
        }catch (Exception e){
            e.printStackTrace();
        }

        return provincias;
    }

    public static ArrayList<Localidad> obtenerLocalidades()
    {
        ArrayList<Localidad> localidades = new ArrayList<>();
        try{
            String query = "select * from %s.%s where estado='A'";
            query=String.format(query,database,"localidades");
            ResultSet rs = execSelect(query);
            while (rs.next())
                localidades.add(new Localidad(rs.getInt("id"),rs.getString("nombre")));
        }catch (Exception e){
            e.printStackTrace();
        }

        return localidades;
    }
}
