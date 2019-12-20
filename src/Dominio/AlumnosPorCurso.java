package Dominio;

public class AlumnosPorCurso {

    private Curso curso;
    private Alumno alumno;
    private String condicion;
    private Integer p1;
    private Integer p2;
    private Integer r1;
    private Integer r2;

    public void setAlumno(Alumno alumno){this.alumno = alumno;}

    public Alumno getAlumno (){ return alumno;}

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public void setCondicion(String condicion) {
        this.condicion = condicion;
    }

    public void setP1(Integer p1) {
        this.p1 = p1;
    }

    public void setP2(Integer p2) {
        this.p2 = p2;
    }

    public void setR1(Integer r1) {
        this.r1 = r1;
    }

    public void setR2(Integer r2) {
        this.r2 = r2;
    }

    public Curso getCurso() {
        return curso;
    }

    public String getCondicion() {
        return condicion;
    }

    public Integer getP1() {
        return p1;
    }

    public Integer getP2() {
        return p2;
    }

    public Integer getR1() {
        return r1;
    }

    public Integer getR2() {
        return r2;
    }
}
