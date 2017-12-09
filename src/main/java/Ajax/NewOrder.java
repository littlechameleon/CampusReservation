package Ajax;

import DAO.TreservationDAO;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;

public class NewOrder extends ActionSupport{
    private JSONArray newOrders;
    @Override
    public String execute() throws Exception {
        TreservationDAO treservationDAO = new TreservationDAO();
        newOrders = JSONArray.fromObject(treservationDAO.getNewOrder(10));


        return SUCCESS;
    }

    public JSONArray getNewOrders() {
        return newOrders;
    }
}
