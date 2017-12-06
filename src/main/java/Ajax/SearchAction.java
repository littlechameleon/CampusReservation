package Ajax;

import DAO.UsersDAO;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;


public class SearchAction extends ActionSupport {

    private JSONArray teacherList;
    private String name;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        teacherList = JSONArray.fromObject(usersDAO.getTeacher(name));
        System.out.println("====");
        System.out.println(teacherList);
        return SUCCESS;
    }

    public void setName(String name) {
        this.name = name;
    }

    public JSONArray getTeacherList() {
        return teacherList;
    }

}
