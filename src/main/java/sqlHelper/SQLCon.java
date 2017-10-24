package sqlHelper;
import java.sql.*;
public class SQLCon {

    // 连接实例
    private static Connection conn = null;
    public SQLCon() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://xmalthiodmoe.mysql.sae.sina.com.cn:10639/bookdb?characterEncoding=utf-8", "root", "hbh828hbh");
    }

    //获得连接对象
    public static Connection getConnection(){
        return conn;
    }

    //关闭连接
    public static void CloseCon() throws SQLException{
        conn.close();
    }
}
