package Action;

import DAO.FollowDAO;
import DAO.ReservationDA0;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EnterRelease extends ActionSupport {
    private String teacherId;       //学生进入某老师预约界面时才用到
    private Date date;
    private List list;
    private ArrayList arrayList;
    private int isFollow;               //是否关注
    private UsersEntity usersEntity;            //老师个人信息

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        if(date == null) {
            date = new java.sql.Date(new Date().getTime());
        }
        else{
            date = new java.sql.Date(date.getTime());
        }
        HttpSession session = ServletActionContext.getRequest().getSession();
        usersEntity = (UsersEntity) session.getAttribute("user");
        if (teacherId != null) {
            FollowDAO followDAO = new FollowDAO();
            isFollow = followDAO.isfollow(usersEntity.getId(),teacherId);
            usersEntity = usersDAO.get(teacherId);
        }
        list = treservationDAO.getOnedayNull(date, usersEntity.getId());
        arrayList = reservationDA0.getOnedayNotnull(date, usersEntity.getId());
        return SUCCESS;
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

    public int getIsFollow() {
        return isFollow;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
