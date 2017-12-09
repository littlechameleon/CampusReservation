package Timer;

import DAO.SreservationDAO;
import Entity.SreservationEntity;
import Entity.TreservationEntity;
import SessionHelper.SessionCon;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletContext;
public class TimerTask extends java.util.TimerTask{

    private static boolean isRunning = false;
    private ServletContext context = null;
    private Transaction tx;

    public TimerTask() {
        super();
    }

    public TimerTask(ServletContext context) {
        this.context = context;
    }

    @Override
    public void run() {
        if (!isRunning) {
            context.log("开始执行指定任务");
                /**
                 * 自己的业务代码
                 */
                Session session = SessionCon.currentSession();
                try {
                    tx = session.beginTransaction();
                    String sql = "from TreservationEntity where (tstate=1 or tstate=0 or tstate=4) and ((current_date = date and current_time > time) or current_date > date)";
                    for(Object o : session.createQuery(sql).list()){
                        TreservationEntity treservationEntity = (TreservationEntity)o;
                        treservationEntity.setTstate(2);
                        session.update(treservationEntity);

                        sql = "from SreservationEntity where torder="+treservationEntity.getTorder();
                        for(Object object:session.createQuery(sql).list()){
                            SreservationEntity sreservationEntity = (SreservationEntity)object;
                            if(sreservationEntity.getSstate()==1){
                                sreservationEntity.setSstate(2);
                            }else{
                                sreservationEntity.setSstate(5);
                            }
                            session.update(sreservationEntity);
                        }
                    }
                    tx.commit();
                } catch (Exception e) {
                    SessionCon.rollback(tx);
                    e.printStackTrace();
                } finally {
                    SessionCon.closeSession();
                }

            isRunning = false;
            context.log("指定任务执行结束");
        } else {
            context.log("上一次任务执行还未结束");
        }
    }
}
