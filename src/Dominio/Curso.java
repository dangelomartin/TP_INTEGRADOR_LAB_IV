package Dominio;

import java.util.ArrayList;

public class Curso extends Modelo {
    private int id;
    private Materia materia;
    private int ano;
    private int semestre;
    private Docente docente;
    private String estado;
    private ArrayList<Alumno> alumnos = new ArrayList<>();

    public Curso(int idCurso) {
        this.id =idCurso;
    }
    public Curso() {}

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public Docente getDocente() {
        return docente;
    }

    public void setDocente(Docente docente) {
        this.docente = docente;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public ArrayList<Alumno> getAlumnos ()
    {
        return alumnos;
    }

    public void agregarAlumno(Integer legajo){
        this.alumnos.add(new Alumno(legajo));
    }
}
