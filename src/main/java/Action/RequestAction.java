package Action;

import DAO.ReservationDA0;
import DAO.SreservationDAO;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.SreservationEntity;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class RequestAction extends ActionSupport {
    private String id;                  //学生自己的id
    private String teacherId;           //学生所查询老师的id
    private Date date;

    private String theme;               //单向传入
    private int torder;

    private List list;                  //单向传出
    private ArrayList arrayList;
    private UsersEntity usersEntity;    //教师信息
    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        SreservationDAO sreservationDAO = new SreservationDAO();
        usersEntity = usersDAO.get(teacherId);
        list = treservationDAO.getOneday(date, usersEntity.getId(),4);
        arrayList = reservationDA0.getOnedayNotnull(date, usersEntity.getId());

        SreservationEntity sreservationEntity = new SreservationEntity();
        sreservationEntity.setTeacherId(teacherId);
        sreservationEntity.setTorder(torder);
        sreservationEntity.setTheme(theme);
        sreservationEntity.setStudentId(id);
        sreservationEntity.setTeacherId(usersEntity.getId());
        sreservationDAO.create(sreservationEntity);
        return SUCCESS;
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public void setTorder(int torder) {
        this.torder = torder;
    }
}
