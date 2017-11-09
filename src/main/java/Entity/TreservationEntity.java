package Entity;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
@Table(name = "treservation", schema = "campusreservation", catalog = "")
public class TreservationEntity {
    private int torder;
    private String teacherId;
    private Date date;
    private Time time;
    private String place;
    private int tstate;
    private int sorder;

    @Id
    @Column(name = "Torder")
    public int getTorder() {
        return torder;
    }

    public void setTorder(int torder) {
        this.torder = torder;
    }

    @Basic
    @Column(name = "TeacherID")
    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "time")
    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    @Basic
    @Column(name = "place")
    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    @Basic
    @Column(name = "Tstate")
    public int getTstate() {
        return tstate;
    }

    public void setTstate(int tstate) {
        this.tstate = tstate;
    }

    @Basic
    @Column(name = "Sorder")
    public int getSorder() {
        return sorder;
    }

    public void setSorder(int sorder) {
        this.sorder = sorder;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TreservationEntity that = (TreservationEntity) o;

        if (torder != that.torder) return false;
        if (tstate != that.tstate) return false;
        if (sorder != that.sorder) return false;
        if (teacherId != null ? !teacherId.equals(that.teacherId) : that.teacherId != null) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;
        if (place != null ? !place.equals(that.place) : that.place != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = torder;
        result = 31 * result + (teacherId != null ? teacherId.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (place != null ? place.hashCode() : 0);
        result = 31 * result + tstate;
        result = 31 * result + sorder;
        return result;
    }
}
