package maincode;

import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;

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

    public String execute() throws Exception {
        UsersDAO userdao = new UsersDAO();
        UsersEntity user = new UsersEntity();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPassword(college);
        user.setContact(contact);
        user.setSex(sex);
        user.setDetail(detail);
        user.setAnswer(answer);
        user.setQuestion(question);
        userdao.update(user);
        user = userdao.get(id);
        if (user.getType() == '1') {
            return "successTea";
        } else {
            return "successStu";
        }

    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}