package Dominio;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Usuario extends Modelo {

    private int legajo;
    private int dni;
    private TipoUsuario tipoUsuario;
    private String pass;
    private String nombre;
    private String apellido;
    private String fechaNac;
    private String direccion;
    private Localidad localidad;
    private Provincia provincia;
    private String email;
    private String telefono;
    private String estado;
    private Date fechaRegistro;

    public int getDni() {
        return dni;
    }

    public int getLegajo() {
        return legajo;
    }

    public void setLegajo(int legajo) {
        this.legajo = legajo;
    }

    public TipoUsuario getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(TipoUsuario tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getFechaNac() {
        return this.fechaNac;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public void setFechaNac(String fechaNac) {
        try {
            SimpleDateFormat viewFormat = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat databaseFormat = new SimpleDateFormat("yyyy-MM-dd");
            this.fechaNac = databaseFormat.format(viewFormat.parse(fechaNac));
        } catch (ParseException e) {
            this.fechaNac = fechaNac;
        }
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Localidad getLocalidad() {
        return localidad;
    }

    public void setLocalidad(Localidad localidad) {
        this.localidad = localidad;
    }

    public Provincia getProvincia() {
        return provincia;
    }

    public void setProvincia(Provincia provincia) {
        this.provincia = provincia;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }


}
