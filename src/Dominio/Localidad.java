package Dominio;

public class Localidad extends Modelo {


    private Integer id;
    private String nombre;
    private String estado;

    public Localidad(Integer id) {
        this.id = id;
    }

    public Localidad(Integer id, String nombre) {
        this(id);
        this.nombre = nombre;
    }

    public Localidad(Integer id, String nombre, String estado) {
        this(id, nombre);
        this.estado = estado;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return this.getNombre();
    }


}
