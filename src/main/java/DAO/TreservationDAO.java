package DAO;

import Entity.TreservationEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sqlHelper.SQLCon;

import java.util.List;

public class TreservationDAO {
    private Transaction tx;

    public TreservationDAO(){

    }

    public void create(TreservationEntity Treservation) throws RuntimeException{       //新增发布预约信息
        Session session = SQLCon.currentSession();
        try {
            tx = session.beginTransaction();
            session.save(Treservation);
            session.flush();
            tx.commit();
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
    }

    public void delete(TreservationEntity Treservation) throws RuntimeException{       //取消发布预约信息
        Session session = SQLCon.currentSession();
        try{
            tx = session.beginTransaction();
            session.delete(Treservation);
            tx.commit();
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
    }

    public TreservationEntity get(int Torder){           //获取教授某条预约信息(教授部分)
        Session session = SQLCon.currentSession();
        try{
            String hql = "from TreservationEntity where torder'" +Torder+ "'";
            List list = session.createQuery(hql).list();
            return (TreservationEntity) list.iterator().next();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
        return null;
    }
}
