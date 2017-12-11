package Ajax;

import DAO.SreservationDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

public class IsReservation extends ActionSupport{
    private boolean IsReservation;
    private int torder;
    @Override
    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");

        SreservationDAO sreservationDAO = new SreservationDAO();
        IsReservation = sreservationDAO.IsAready(torder,usersEntity.getId());
        return SUCCESS;
    }

    public void setTorder(int torder) {
        this.torder = torder;
    }

    public boolean isReservation() {
        return IsReservation;
    }
}
