package Action;

import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

public class RegisterAction extends ActionSupport {
    private String password;
    private String name;
    private String email;
    private String id;
    private byte type;
    private UsersEntity usersEntity;

    public String register() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        usersEntity = new UsersEntity();
        usersEntity.setId(id);
        usersEntity.setName(name);
        usersEntity.setEmail(email);
        usersEntity.setPassword(password);
        usersEntity.setType(type);
        usersEntity.setScore(80);
        usersEntity.setFollowNum(0);
        if (!usersDAO.find(id)) {
            usersDAO.create(usersEntity);
            HttpSession session = ServletActionContext.getRequest().getSession();
            session.setAttribute("user", usersEntity);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(byte type) {
        this.type = type;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public UsersEntity getUsersEntity() {
        return usersEntity;
    }

}
