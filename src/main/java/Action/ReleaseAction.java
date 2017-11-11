package Action;

import DAO.ReservationDA0;
import DAO.TreservationDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReleaseAction extends ActionSupport {
    private UsersEntity usersEntity;
    private Date date;
    private List list;
    private ArrayList arrayList;
    public String execute() throws Exception {
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        list = treservationDAO.getOneday(date, usersEntity.getId(),4);
        arrayList = reservationDA0.getOnedayNotnull(date, usersEntity.getId());
        return SUCCESS;
    }

}
