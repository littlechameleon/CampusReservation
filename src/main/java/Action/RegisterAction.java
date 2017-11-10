package Action;

import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
    private String password;
    private String name;
    private String email;
    private String id;
    private byte type;
    private UsersEntity user;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        user = new UsersEntity();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setType(type);
        user.setScore(100);
        if (!usersDAO.find(id)) {
            usersDAO.create(user);
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

    public void setUser(UsersEntity user) {
        this.user = user;
    }

    public UsersEntity getUser() {
        return user;
    }

}
