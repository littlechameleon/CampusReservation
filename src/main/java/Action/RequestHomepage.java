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

public class RequestHomepage extends ActionSupport {
    private ArrayList unjudgedList;
    private ArrayList judgedList;
    private ArrayList unconfirmedList;
    private ArrayList confirmedList;
    private ArrayList refusedList;

    private String theme;               //单向传入
    private int torder;

    public String execute() throws Exception {
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        SreservationDAO sreservationDAO = new SreservationDAO();
        TreservationEntity treservationEntity = treservationDAO.get(torder);
        SreservationEntity sreservationEntity = new SreservationEntity();

        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");

        sreservationEntity.setTeacherId(treservationEntity.getTeacherId());
        sreservationEntity.setTorder(torder);
        sreservationEntity.setTheme(theme);
        sreservationEntity.setStudentId(usersEntity.getId());
        sreservationDAO.create(sreservationEntity, treservationEntity);

        unconfirmedList = reservationDA0.get(usersEntity.getId(), 0);
        confirmedList = reservationDA0.get(usersEntity.getId(), 1);
        unjudgedList = reservationDA0.get(usersEntity.getId(), 2);
        judgedList = reservationDA0.get(usersEntity.getId(), 3);
        refusedList = reservationDA0.get(usersEntity.getId(), 4);
        return SUCCESS;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public void setTorder(int torder) {
        this.torder = torder;
    }

    public ArrayList getUnjudgedList() {
        return unjudgedList;
    }

    public ArrayList getJudgedList() {
        return judgedList;
    }

    public ArrayList getUnconfirmedList() {
        return unconfirmedList;
    }

    public ArrayList getConfirmedList() {
        return confirmedList;
    }

    public ArrayList getRefusedList() {
        return refusedList;
    }
}
