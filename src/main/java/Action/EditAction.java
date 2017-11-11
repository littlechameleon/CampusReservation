package Action;

import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

public class EditAction extends ActionSupport {
    private UsersEntity usersEntity;
    private String id;

    public String execute() throws Exception{
        UsersDAO usersDAO = new UsersDAO();
        usersEntity = usersDAO.get(id);
        System.out.println(usersEntity.getName());
        return SUCCESS;
    }

    public void setId(String id) {
        this.id = id;
    }

    public UsersEntity getUsersEntity() {
        return usersEntity;
    }
}
