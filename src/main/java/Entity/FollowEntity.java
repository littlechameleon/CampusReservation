package Entity;

import javax.persistence.*;

@Entity
@Table(name = "follow", schema = "campusreservation", catalog = "")
public class FollowEntity {
    private int forder;
    private String follower;
    private String followed;

    @Id
    @Column(name = "forder")
    public int getForder() {
        return forder;
    }

    public void setForder(int forder) {
        this.forder = forder;
    }

    @Basic
    @Column(name = "follower")
    public String getFollower() {
        return follower;
    }

    public void setFollower(String follower) {
        this.follower = follower;
    }

    @Basic
    @Column(name = "followed")
    public String getFollowed() {
        return followed;
    }

    public void setFollowed(String followed) {
        this.followed = followed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FollowEntity that = (FollowEntity) o;

        if (forder != that.forder) return false;
        if (follower != null ? !follower.equals(that.follower) : that.follower != null) return false;
        if (followed != null ? !followed.equals(that.followed) : that.followed != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = forder;
        result = 31 * result + (follower != null ? follower.hashCode() : 0);
        result = 31 * result + (followed != null ? followed.hashCode() : 0);
        return result;
    }
}
