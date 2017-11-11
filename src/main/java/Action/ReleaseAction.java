package Action;

import DAO.ReservationDA0;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.TreservationEntity;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReleaseAction extends ActionSupport {
    private String id;
    private Date date;
    private List list;
    private ArrayList arrayList;
    private UsersEntity usersEntity;
    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        usersEntity = usersDAO.get(id);
        list = treservationDAO.getOneday(date, usersEntity.getId(),4);
        arrayList = reservationDA0.getOnedayNotnull(date, usersEntity.getId());

        Time time = Time.valueOf("12:00:00");
        String place = "sasdf";
        TreservationEntity treservationEntity = new TreservationEntity();
        treservationEntity.setTime(time);
        treservationEntity.setPlace(place);
        //treservationEntity.setDate(date);
        treservationEntity.setTeacherId(usersEntity.getId());
        treservationDAO.create(treservationEntity);

        return SUCCESS;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public List getList() {
        return list;
    }

    public ArrayList getArrayList() {
        return arrayList;
    }

    public UsersEntity getUsersEntity() {
        return usersEntity;
    }
}
