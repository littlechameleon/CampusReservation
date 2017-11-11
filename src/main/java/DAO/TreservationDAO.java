package DAO;

import Entity.TreservationEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SessionHelper.SessionCon;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TreservationDAO {
    private Transaction tx;

    public TreservationDAO(){

    }

    public void create(TreservationEntity Treservation) throws RuntimeException{       //新增发布预约信息
        Session session = SessionCon.currentSession();
        try {
            tx = session.beginTransaction();
            Treservation.setTstate(4);
            session.save(Treservation);
            session.flush();
            tx.commit();
        }catch (Exception e){
            SessionCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
    }

    public void delete(TreservationEntity Treservation) throws RuntimeException{       //取消发布预约信息
        Session session = SessionCon.currentSession();
        TreservationDAO treservationDAO = new TreservationDAO();
        try{
            tx = session.beginTransaction();



            session.delete(Treservation);
            tx.commit();
        }catch (Exception e){
            SessionCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
    }

    public TreservationEntity get(int Torder){           //获取教授某条预约信息(教授部分)
        Session session = SessionCon.currentSession();
        try{
            String hql = "from TreservationEntity where torder=" +Torder;
            List list = session.createQuery(hql).list();
            return (TreservationEntity) list.iterator().next();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return null;
    }

    public List getOneday(Date date, String TeacherID, int state){         //获取某天教授某状态的预约信息
        Session session = SessionCon.currentSession();
        try{
            String hql = "from TreservationEntity where teacherId='" +TeacherID+ "' and tstate =" +state+ " and date='"+date+"'";
            return session.createQuery(hql).list();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return null;
    }

    public List getOnedayNotnull(Date date, String TeacherID){         //获取某天教授有请求的预约信息
        Session session = SessionCon.currentSession();
        try{
            String hql = "from TreservationEntity where teacherId='" +TeacherID+ "' and tstate<4 and tstate>0 and date='"+date+"'";
            return session.createQuery(hql).list();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return null;
    }

    public List getNullList(String TeacherID){             //获取教授发布但没有学生预约的预约信息
        Session session = SessionCon.currentSession();
        try {
            String hql = "from TreservationEntity where teacherId='" +TeacherID+ "' and tstate = 4";
            return session.createQuery(hql).list();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return null;
    }
}
