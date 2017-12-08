package Ajax;

import DAO.FollowDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;

public class FollowAction extends ActionSupport{
    private String teacherId;
    private int followType;
    @Override
    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");
        FollowDAO followDAO = new FollowDAO();
        followDAO.add(usersEntity.getId(),teacherId,followType);
        return SUCCESS;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public void setFollowType(int followType) {
        this.followType = followType;
    }
}
