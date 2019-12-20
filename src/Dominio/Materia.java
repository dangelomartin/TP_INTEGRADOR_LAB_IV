package Dominio;

public class Materia extends Modelo {
    private int id;
    private Carrera carrera;
    private String nombre;
    private String estado;

    public Materia(int id,String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public Materia(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
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

}
