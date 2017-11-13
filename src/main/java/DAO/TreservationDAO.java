package DAO;

import Entity.SreservationEntity;
import Entity.TreservationEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SessionHelper.SessionCon;
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
            String hql = "from SreservationEntity where torder = " + Treservation.getTorder();
            List list = session.createQuery(hql).list();
            for(Object o : list){
                SreservationEntity sreservationEntity = (SreservationEntity) o;
                session.delete(sreservationEntity);
            }
            session.delete(Treservation);
            tx.commit();
        }catch (Exception e){
            SessionCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
    }

    public void agree(SreservationEntity sreservationEntity, TreservationEntity treservationEntity){       //同意预约
        Session session = SessionCon.currentSession();
        try{
            tx = session.beginTransaction();
            treservationEntity.setTstate(1);
            sreservationEntity.setSstate(1);
            session.update(treservationEntity);
            session.update(sreservationEntity);
            String hql = "update SreservationEntity set sstate=4 where sstate=0 and torder="+sreservationEntity.getTorder();
            session.createQuery(hql).executeUpdate();
            System.out.println(hql);
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

    public List getOnedayNull(Date date, String TeacherID){         //获取某天教授不确定的预约信息
        Session session = SessionCon.currentSession();
        try{
            String hql = "from TreservationEntity where teacherId='" +TeacherID+ "' and (tstate = 0 or tstate = 4) and date='"+date+"'";
            return session.createQuery(hql).list();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return null;
    }

    public List getOnedayNotnull(Date date, String TeacherID){         //获取某天教授已确定的预约信息
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
            String hql = "from TreservationEntity where teacherId='" +TeacherID+ "' and (tstate = 4 or tstate = 0)";
            return session.createQuery(hql).list();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return null;
    }
}
