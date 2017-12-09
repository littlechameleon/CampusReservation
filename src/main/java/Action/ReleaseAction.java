package Action;

import DAO.ReservationDA0;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.TreservationEntity;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class ReleaseAction extends ActionSupport {
    private Date date;                      //双向传

    private String[] releaseList;           //单向传入

    private List list;                      //单向传出
    private ArrayList arrayList;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");
        if (releaseList != null) {
            for (String strings : releaseList) {
                String string[] = strings.split(",");
                TreservationEntity treservationEntity = new TreservationEntity();
                treservationEntity.setTime(string[0]);
                treservationEntity.setPlace(string[1]);
                treservationEntity.setDate(String.valueOf(date));
                treservationEntity.setTeacherId(usersEntity.getId());
                treservationDAO.create(treservationEntity);
            }
        }
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

    public void setReleaseList(String[] releaseList) {
        this.releaseList = releaseList;
    }
}
