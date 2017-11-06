package maincode;
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

    public String execute() throws SQLException{
        try{
            new SQLCon();
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
        ResultSet rs = null;
        String sql = "update campusreservation.users set name='"+name+"',contact='"+contact+"',college='"+college+"',email='"+email+"',detail='"+detail.replace("'","''")+"',sex="+sex+" where id='"+id+"'";
        try {
            SQLCon.getConnection().createStatement().execute(sql);
            sql = "select type from campusreservation.users where id=" + id;
            try{
                rs = SQLCon.getConnection().createStatement().executeQuery(sql);
                if (rs.next()) {
                    type = rs.getBoolean("type");
                    if (type == true) {
                        return "successTea";
                    } else {
                        return "successStu";
                    }
                } else{
                    return ERROR;
                }
            }catch (SQLException e){
                e.printStackTrace();
                return ERROR;
            }
        }catch (SQLException e){
            e.printStackTrace();
            return ERROR;
        }finally {
            SQLCon.CloseCon();
        }
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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;

    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {

        this.detail = detail;
    }

    public void setCollege(String college) {

        this.college = college;
    }

    public String getCollege() {

        return college;
    }

}
