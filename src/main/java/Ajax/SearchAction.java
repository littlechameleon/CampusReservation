package Ajax;

import DAO.UsersDAO;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;

public class SearchAction extends ActionSupport {

    private JSONArray teacherList;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        teacherList = JSONArray.fromObject(usersDAO.getTeacher());
        return SUCCESS;
    }

    public JSONArray getTeacherList() {
        return teacherList;
    }
}
