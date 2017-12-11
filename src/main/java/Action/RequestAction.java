package Action;

import DAO.*;
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
    private Date date;

    private String theme;               //单向传入
    private int torder;

    private List list;                  //单向传出
    private ArrayList arrayList;
    private UsersEntity usersEntity;    //教师信息
    private int isFollow;               //是否关注

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
            sreservationEntity.setTeacherId(treservationEntity.getTeacherId());
            sreservationEntity.setTorder(torder);
            sreservationEntity.setTheme(theme);
            sreservationEntity.setStudentId(usersEntity.getId());
            sreservationDAO.create(sreservationEntity, treservationEntity);
        }
        usersEntity = usersDAO.get(treservationEntity.getTeacherId());
        FollowDAO followDAO = new FollowDAO();
        isFollow = followDAO.isfollow(usersEntity.getId(),treservationEntity.getTeacherId());
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

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public void setTorder(int torder) {
        this.torder = torder;
    }

    public int getIsFollow() {
        return isFollow;
    }
}
