package Action;

import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

public class EnterDetail extends ActionSupport{
    private String id;
    private String visitId;
    private UsersEntity usersEntity;

    public String execute() throws Exception{
        UsersDAO usersDAO = new UsersDAO();
        usersEntity = usersDAO.get(visitId);
        return SUCCESS;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setVisitId(String visitId) {
        this.visitId = visitId;
    }

    public UsersEntity getUsersEntity() {
        return usersEntity;
    }
}
