package Ajax;

import DAO.TreservationDAO;
import DAO.UsersDAO;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class NewOrder extends ActionSupport{
    private JSONArray newOrders;
    private JSONArray newTeacher;
    private JSONArray newStudent;
    @Override
    public String execute() throws Exception {
        int MAX_NUM = 10;
        TreservationDAO treservationDAO = new TreservationDAO();
        UsersDAO usersDAO = new UsersDAO();
        newOrders = JSONArray.fromObject(treservationDAO.getNewOrder(MAX_NUM));
        newTeacher = JSONArray.fromObject(usersDAO.getNewTeacher(MAX_NUM));
        newStudent = JSONArray.fromObject(usersDAO.getNewStudent(MAX_NUM));
        return SUCCESS;
    }

    public JSONArray getNewOrders() {
        return newOrders;
    }

    public JSONArray getNewTeacher() {
        return newTeacher;
    }

    public JSONArray getNewStudent() {
        return newStudent;
    }
}
