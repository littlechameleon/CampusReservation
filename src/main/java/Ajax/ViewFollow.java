package Ajax;

import DAO.FollowDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class ViewFollow extends ActionSupport{
    private ArrayList followList;
    @Override
    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");
        FollowDAO followDAO = new FollowDAO();
        followList = followDAO.getfollow(usersEntity.getId());
        return SUCCESS;
    }

    public ArrayList getFollowList() {
        return followList;
    }
}
