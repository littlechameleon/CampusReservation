package maincode;
import DAO.UsersDAO;
import Entity.UsersEntity;
import sqlHelper.SQLCon;
import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;

public class ModifyAction extends ActionSupport {
    private String name;
    private String contact;
    private String id;
    private String email;
    private String college;
    private Boolean type;
    private Boolean sex;
    private String detail;

    public String execute() throws Exception{
        UsersDAO userdao = new UsersDAO();
        UsersEntity user = new UsersEntity();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPassword(college);
    }
        try{

                    if (type == true) {
                        return "successTea";
                    } else {
                        return "successStu";
    }

}
