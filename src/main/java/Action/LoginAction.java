package Action;

import DAO.ReservationDA0;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

public class LoginAction extends ActionSupport {
    private String password;
    private String id;
    private UsersEntity user;
    private ArrayList unjudgedList;
    private ArrayList judgedList;
    private ArrayList unconfirmedList;
    private ArrayList confirmedList;
    private ArrayList refusedList;
    private List nullList;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        user = new UsersEntity();
        user.setId(id);
        user.setPassword(password);
        if (usersDAO.login(user)) {
            user = usersDAO.get(id);
            unconfirmedList = reservationDA0.get(id, 0);
            confirmedList = reservationDA0.get(id, 1);
            unjudgedList = reservationDA0.get(id, 2);
            judgedList = reservationDA0.get(id, 3);
            System.out.println(judgedList);
            if (user.getType() == 1) {
                nullList = treservationDAO.getNullList(id);
                return "successTea";
            } else {
                refusedList = reservationDA0.get(id, 4);
                return "successStu";
            }
        } else {
            return ERROR;
        }
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setId(String id) {
        this.id = id;
    }

    public UsersEntity getUser() {
        return user;
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

    public List getNullList() {
        return nullList;
    }
}