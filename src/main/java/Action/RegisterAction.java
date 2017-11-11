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
    private UsersEntity usersEntity;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        usersEntity = new UsersEntity();
        usersEntity.setId(id);
        usersEntity.setName(name);
        usersEntity.setEmail(email);
        usersEntity.setPassword(password);
        usersEntity.setType(type);
        usersEntity.setScore(100);
        if (!usersDAO.find(id)) {
            usersDAO.create(usersEntity);
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
