package Action;

import DAO.ReservationDA0;
import DAO.SreservationDAO;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.SreservationEntity;
import Entity.TreservationEntity;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class RequestAction extends ActionSupport {
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
        TreservationEntity treservationEntity = treservationDAO.get(torder);
        if (theme != null) {
            SreservationEntity sreservationEntity = new SreservationEntity();
            HttpSession session = ServletActionContext.getRequest().getSession();
            UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");
            sreservationEntity.setTeacherId(teacherId);
            sreservationEntity.setTorder(torder);
            sreservationEntity.setTheme(theme);
            sreservationEntity.setStudentId(usersEntity.getId());
            sreservationDAO.create(sreservationEntity, treservationEntity);
        }
        usersEntity = usersDAO.get(teacherId);
        list = treservationDAO.getOnedayNull(date, usersEntity.getId());
        arrayList = reservationDA0.getOnedayNotnull(date, usersEntity.getId());
        return SUCCESS;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public void setTorder(int torder) {
        this.torder = torder;
    }
}
