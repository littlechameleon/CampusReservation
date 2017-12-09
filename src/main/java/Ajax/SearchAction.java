package Ajax;

import DAO.UsersDAO;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class SearchAction extends ActionSupport {

    private JSONArray teacherList;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"password","question","answer","detail","contact","workplace","type","sex","score","email"});
        teacherList = JSONArray.fromObject(usersDAO.getTeacher(),jsonConfig);
        return SUCCESS;
    }

    public JSONArray getTeacherList() {
        return teacherList;
    }
}
