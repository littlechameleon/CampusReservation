package Ajax;

import DAO.FollowDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;

public class ViewFollow extends ActionSupport{
    private JSONArray followList;
    @Override
    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");
        FollowDAO followDAO = new FollowDAO();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"password","question","answer","detail","contact","workplace","type","sex","score","email","followNum"});
        followList = JSONArray.fromObject(followDAO.getfollow(usersEntity.getId()),jsonConfig);
        return SUCCESS;
    }


    public JSONArray getFollowList() {
        return followList;
    }
}
