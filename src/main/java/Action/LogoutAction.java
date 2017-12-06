package Action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;

public class LogoutAction extends ActionSupport{

    public String execute() throws Exception{
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.removeAttribute("user");
        return SUCCESS;
    }
}
