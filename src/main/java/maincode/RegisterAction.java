package maincode;

import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
    private String password;
    private String name;
    private String email;
    private String id;
    private byte type;

    public String execute() throws Exception {
        UsersDAO userdao = new UsersDAO();
        UsersEntity user = new UsersEntity();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setType(type);
        if (!userdao.find(id)) {
            userdao.create(user);
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
}
