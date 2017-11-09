package Action;

import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.UsersEntity;
import Helper.Mapping;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;
import java.util.Map;

public class LoginAction extends ActionSupport {
    private String password;
    private String id;
    private UsersEntity user;
    private Map map;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        Mapping mapping = new Mapping();
        user = new UsersEntity();
        user.setId(id);
        user.setPassword(password);
        if (usersDAO.login(user)) {
            user = usersDAO.get(id);
            map = mapping.reservationMap(id);
            if (user.getType() == 1) {
                return "successTea";
            } else {
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

    public void setUser(UsersEntity user) {
        this.user = user;
    }

    public Map getMap() {
        return map;
    }
}