package maincode;

import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
    private String password;
    private String id;
    private Boolean type;

    public String execute() throws Exception {
        UsersDAO userdao = new UsersDAO();
        UsersEntity user = new UsersEntity();
        user.setId(id);
        user.setPassword(password);
        if (userdao.login(user)) {
            user = userdao.get(id);
            if (user.getType() == '1') {
                return "successTea";
            } else {
                return "successStu";
            }
        } else {
            return ERROR;
        }
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setId(String id) {
        this.id = id;
    }
}