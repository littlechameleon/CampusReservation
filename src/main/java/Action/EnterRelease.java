package Action;

import DAO.ReservationDA0;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EnterRelease extends ActionSupport {
    private String id;              //用户自己的id
    private String teacherId;       //学生进入某老师预约界面时才用到
    private Date date;
    private List list;
    private ArrayList arrayList;
    private UsersEntity usersEntity;            //老师个人信息
    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        date = new java.sql.Date(new Date().getTime());
        usersEntity = usersDAO.get(id);
        list = treservationDAO.getOnedayNull(date, usersEntity.getId());
        arrayList = reservationDA0.getOnedayNotnull(date, usersEntity.getId());
        return SUCCESS;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ArrayList getArrayList() {
        return arrayList;
    }

    public List getList() {
        return list;
    }

    public Date getDate() {
        return date;
    }

    public UsersEntity getUsersEntity() {
        return usersEntity;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }
}
