package Ajax;

import DAO.UsersDAO;
import com.opensymphony.xwork2.ActionSupport;

public class VerifyIdAction extends ActionSupport {

    private String id;
    private int VerifyId;
    public String execute() throws Exception{
        UsersDAO usersDAO = new UsersDAO();
        VerifyId = usersDAO.find(id)?1:0;
        return SUCCESS;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getVerifyId() {
        return VerifyId;
    }
}
