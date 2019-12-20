package Dominio;

public class Alumno extends Usuario {
    public Alumno() {
        this.setTipoUsuario(new TipoUsuario(3));
    }

    public Alumno (Integer legajo){
        this();
        this.setLegajo(legajo);
    }

    public Alumno(int legajoAlumno, String nombre, String apellido) {
        this(legajoAlumno);
        this.setNombre(nombre);
        this.setApellido(apellido);
    }
}
