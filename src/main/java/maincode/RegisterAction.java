package maincode;
import sqlHelper.SQLCon;
import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
    private String name;
    private String password;
    private String id;
    private String email;
    private Boolean type;

    public String execute() throws SQLException{
        try{
            new SQLCon();
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
        ResultSet rs = null;
        String sql = "select * from campusreservation.users where id=" + id;
        try {
            rs = SQLCon.getConnection().createStatement().executeQuery(sql);
            if (rs.next()){
                return ERROR;
            }
            else{
                sql = "insert into campuereservation.users values('"+id+"','"+name+"','"+password+"','"+email+"',"+type+")";
                try{
                    SQLCon.getConnection().createStatement().execute(sql);
                }catch (SQLException e){
                    e.printStackTrace();
                    return ERROR;
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String getName() {
        return name;
    }

    public String getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public Boolean getType() {
        return type;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
