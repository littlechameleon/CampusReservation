package Ajax;

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

public class RequestAction extends ActionSupport{
    private int torder;
    private String theme;

    @Override
    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
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
        return SUCCESS;
    }
}
