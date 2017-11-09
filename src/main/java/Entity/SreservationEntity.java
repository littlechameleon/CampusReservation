package Entity;

import javax.persistence.*;

@Entity
@Table(name = "sreservation", schema = "campusreservation", catalog = "")
public class SreservationEntity {
    private int sorder;
    private String studentId;
    private String theme;
    private int sstate;
    private int torder;
    private String teacherId;

    @Id
    @Column(name = "Sorder")
    public int getSorder() {
        return sorder;
    }

    public void setSorder(int sorder) {
        this.sorder = sorder;
    }

    @Basic
    @Column(name = "StudentID")
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    @Basic
    @Column(name = "theme")
    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    @Basic
    @Column(name = "Sstate")
    public int getSstate() {
        return sstate;
    }

    public void setSstate(int sstate) {
        this.sstate = sstate;
    }

    @Basic
    @Column(name = "Torder")
    public int getTorder() {
        return torder;
    }

    public void setTorder(int torder) {
        this.torder = torder;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SreservationEntity that = (SreservationEntity) o;

        if (sorder != that.sorder) return false;
        if (sstate != that.sstate) return false;
        if (torder != that.torder) return false;
        if (studentId != null ? !studentId.equals(that.studentId) : that.studentId != null) return false;
        if (theme != null ? !theme.equals(that.theme) : that.theme != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sorder;
        result = 31 * result + (studentId != null ? studentId.hashCode() : 0);
        result = 31 * result + (theme != null ? theme.hashCode() : 0);
        result = 31 * result + sstate;
        result = 31 * result + torder;
        return result;
    }

    @Basic
    @Column(name = "TeacherID")
    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }
}
