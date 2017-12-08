package Ajax;

import DAO.FollowDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;

public class UnfollowAction extends ActionSupport{
    private String teacherId;
    @Override
    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");
        FollowDAO followDAO = new FollowDAO();
        followDAO.delete(usersEntity.getId(),teacherId);
        return SUCCESS;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }
}
