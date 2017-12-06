package Action;

import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

public class EnterDetail extends ActionSupport{
    private String visitId;
    private UsersEntity usersEntity;

    public String execute() throws Exception{
        UsersDAO usersDAO = new UsersDAO();
        usersEntity = usersDAO.get(visitId);
        return SUCCESS;
    }

    public void setVisitId(String visitId) {
        this.visitId = visitId;
    }

    public UsersEntity getUsersEntity() {
        return usersEntity;
    }
}
