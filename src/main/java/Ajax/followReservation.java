package Ajax;

import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

public class followReservation extends ActionSupport{
    private JSONArray followOrders;
    private JSONArray followTeacher;
    private JSONArray followStudent;
    @Override
    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");


        JsonConfig jsonConfigUser = new JsonConfig();
        jsonConfigUser.setExcludes(new String[]{"password","question","answer","detail","workplace","type","sex","score","followNum"});
        TreservationDAO treservationDAO = new TreservationDAO();
        UsersDAO usersDAO = new UsersDAO();
        followOrders = JSONArray.fromObject(treservationDAO.getfollowTreservation(usersEntity.getId()));
        followTeacher = JSONArray.fromObject(usersDAO.getfollowTeacher(usersEntity.getId()),jsonConfigUser);
        followStudent = JSONArray.fromObject(usersDAO.getfollowStudent(usersEntity.getId()));
        return SUCCESS;
    }

    public JSONArray getFollowOrders() {
        return followOrders;
    }

    public JSONArray getFollowTeacher() {
        return followTeacher;
    }

    public JSONArray getFollowStudent() {
        return followStudent;
    }
}
