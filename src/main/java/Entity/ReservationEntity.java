package Entity;

public class ReservationEntity {
    private SreservationEntity sreservationEntity;
    private TreservationEntity treservationEntity;
    private UsersEntity usersEntity;


    public SreservationEntity getSreservationEntity() {
        return sreservationEntity;
    }

    public void setSreservationEntity(SreservationEntity sreservationEntity) {
        this.sreservationEntity = sreservationEntity;
    }

    public TreservationEntity getTreservationEntity() {
        return treservationEntity;
    }

    public void setTreservationEntity(TreservationEntity treservationEntity) {
        this.treservationEntity = treservationEntity;
    }

    public UsersEntity getUsersEntity() {
        return usersEntity;
    }

    public void setUsersEntity(UsersEntity usersEntity) {
        this.usersEntity = usersEntity;
    }
}
