package Action;

import DAO.UsersDAO;
import Entity.UsersEntity;
import Helper.Mapping;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Map;

public class ModifyAction extends ActionSupport {
    private String name;
    private String contact;
    private String id;
    private String email;
    private String college;
    private byte sex;
    private String detail;
    private String question;
    private String answer;
    private UsersEntity user;
    private Map map;

    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        Mapping mapping = new Mapping();

        user = usersDAO.get(id);
        user.setName(name);
        user.setEmail(email);
        user.setCollege(college);
        user.setContact(contact);
        user.setSex(sex);
        user.setDetail(detail);
        user.setAnswer(answer);
        user.setQuestion(question);
        usersDAO.update(user);
        map = mapping.reservationMap(id);
        if (user.getType() == 1) {
            return "successTea";
        } else {
            return "successStu";
        }

    }

    public void setName(String name) {
        this.name = name;
    }

    public UsersEntity getUser() {
        return user;
    }

    public void setUser(UsersEntity user) {
        this.user = user;
    }

    public Map getMap() {
        return map;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public void setSex(byte sex) {
        this.sex = sex;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setId(String id) {
        this.id = id;
    }
}