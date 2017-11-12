package Ajax;

import DAO.UsersDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;


public class SearchAction extends ActionSupport {

    private String name;
    private List teacherList;
    public String execute() throws Exception{
        UsersDAO usersDAO = new UsersDAO();
        teacherList = usersDAO.getTeacher(name);
        return SUCCESS;
    }


    public void setName(String name) {
        this.name = name;
    }

    public List getTeacherList() {
        return teacherList;
    }
}
