package Ajax;

import DAO.UsersDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ScoreAction extends ActionSupport{
    private int score;
    private int torder;

    @Override
    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        usersDAO.score(torder,score);
        return SUCCESS;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public void setTorder(int torder) {
        this.torder = torder;
    }
}
