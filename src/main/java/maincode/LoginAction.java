package maincode;
import sqlHelper.SQLCon;
import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
    private String password;
    private String id;
    private Boolean type;

    public String execute() throws SQLException {
        try{
            new SQLCon();
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
        ResultSet rs = null;
        String sql = "select * from campusreservation.users where id='" +id+ "'";
        try{
            rs = SQLCon.getConnection().createStatement().executeQuery(sql);
            if(rs.next()){
                sql = "select type from campusreservation.users where id='" +id+ "' and password='" +password+ "'";
                try{
                    rs = SQLCon.getConnection().createStatement().executeQuery(sql);
                    if(rs.next()){
                        type = rs.getBoolean("type");
                        if(type == true){
                            return "successTea";
                        } else{
                            return "successStu";
                        }
                    } else {
                        return ERROR;
                    }
                }catch (SQLException e){
                    e.printStackTrace();
                    return ERROR;
                }
            }else{
                return ERROR;
            }
        }catch (SQLException e){
            e.printStackTrace();
            return ERROR;
        }finally {
            SQLCon.CloseCon();
        }
        }
    }