package Action;

import DAO.ReservationDA0;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.TreservationEntity;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

public class CancelRelease extends ActionSupport {
    private String id;
    private int Torder;
    private UsersEntity usersEntity;
    private ArrayList unjudgedList;
    private ArrayList judgedList;
    private ArrayList unconfirmedList;
    private ArrayList confirmedList;
    private ArrayList refusedList;
    private List nullList;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        TreservationDAO treservationDAO = new TreservationDAO();
        ReservationDA0 reservationDA0 = new ReservationDA0();
        usersEntity = usersDAO.get(id);
        TreservationEntity treservationEntity = new TreservationEntity();
        treservationEntity.setTorder(Torder);
        treservationDAO.delete(treservationEntity);
        unconfirmedList = reservationDA0.get(id, 0);
        confirmedList = reservationDA0.get(id, 1);
        unjudgedList = reservationDA0.get(id, 2);
        judgedList = reservationDA0.get(id, 3);
        if (usersEntity.getType() == 1) {
            nullList = treservationDAO.getNullList(id);
            return "successTea";
        } else {
            refusedList = reservationDA0.get(id, 4);
            return "successStu";
        }
    }


    public void setId(String id) {
        this.id = id;
    }

    public UsersEntity getUsersEntity() {
        return usersEntity;
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

    public void setTorder(int torder) {
        Torder = torder;
    }
}