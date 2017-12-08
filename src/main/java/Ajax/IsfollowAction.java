package Ajax;

import DAO.FollowDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;

public class IsfollowAction extends ActionSupport{
    private String teacherId;
    private int Isfollow;               //1为已关注
    @Override
    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");
        FollowDAO followDAO = new FollowDAO();
        Isfollow = followDAO.isfollow(usersEntity.getId(),teacherId);
        return SUCCESS;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public int getIsfollow() {
        return Isfollow;
    }
}
