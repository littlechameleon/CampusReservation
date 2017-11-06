package maincode;
import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
    private String password;
    private String id;
    public String execute() throws Exception{
        UsersDAO userdao = new UsersDAO();
        UsersEntity user = new UsersEntity();
        user.setId(id);
        user.setPassword(password);
        if(!userdao.find(id)){
            userdao.create(user);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
