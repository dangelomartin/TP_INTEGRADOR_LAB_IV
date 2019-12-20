package Dominio;

public class Docente extends Usuario {
    public Docente() {
        this.setTipoUsuario(new TipoUsuario(2));
    }
    public Docente(Integer legajo) {
        this();
        this.setLegajo(legajo);
    }

    public Docente(Integer legajo, String nombre, String apellido) {
        this(legajo);
        this.setNombre(nombre);
        this.setApellido(apellido);
    }
}



/*{
    private int legajo;
    private int dni;
    private String nombre;
    private String fechanac;
    private String direccion;
    private String localidad;
    private String provincia;

    public Docente(int legajo, int dni, String nombre, String fechanac, String direccion, String localidad,
                   String provincia) {
        super();
        this.legajo = legajo;
        this.dni = dni;
        this.nombre = nombre;
        this.fechanac = fechanac;
        this.direccion = direccion;
        this.localidad = localidad;
        this.provincia = provincia;
    }

    @Override
    public String toString() {
        return "docente [legajo=" + legajo + ", dni=" + dni + ", nombre=" + nombre + ", fechanac=" + fechanac
                + ", direccion=" + direccion + ", localidad=" + localidad + ", provincia=" + provincia + "]";
    }

    public int getLegajo() {
        return legajo;
    }

    public void setLegajo(int legajo) {
        this.legajo = legajo;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFechanac() {
        return fechanac;
    }

    public void setFechanac(String fechanac) {
        this.fechanac = fechanac;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }
}
*/