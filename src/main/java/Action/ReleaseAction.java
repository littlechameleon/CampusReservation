package Action;

import DAO.ReservationDA0;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.ReservationEntity;
import Entity.TreservationEntity;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class ReleaseAction extends ActionSupport {
    private Date date;                      //双向传

    private String id;                      //单向传入
    private String[] releaseList;

    private List list;                      //单向传出
    private ArrayList arrayList;
    private UsersEntity usersEntity;
    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        usersEntity = usersDAO.get(id);
        list = treservationDAO.getOnedayNull(date, usersEntity.getId());
        arrayList = reservationDA0.getOnedayNotnull(date, usersEntity.getId());
        if(releaseList != null) {
            for (String strings : releaseList) {
                String string[] = strings.split(",");
                TreservationEntity treservationEntity = new TreservationEntity();
                treservationEntity.setTime(Time.valueOf(string[0]));
                treservationEntity.setPlace(string[1]);
                treservationEntity.setDate(date);
                treservationEntity.setTeacherId(usersEntity.getId());
                treservationDAO.create(treservationEntity);
            }
        }
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

    public void setReleaseList(String[] releaseList) {
        this.releaseList = releaseList;
    }
}
