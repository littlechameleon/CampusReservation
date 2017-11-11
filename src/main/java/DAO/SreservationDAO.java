package DAO;

import Entity.SreservationEntity;
import Entity.TreservationEntity;
import Entity.UsersEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SessionHelper.SessionCon;

import java.util.List;

public class SreservationDAO {
    private Transaction tx;

    public SreservationDAO(){

    }

    public void create(SreservationEntity Sreservation, int Torder) throws RuntimeException{    //新增请求预约信息
        Session session = SessionCon.currentSession();
        TreservationDAO treservationDAO = new TreservationDAO();
        TreservationEntity treservationEntity = treservationDAO.get(Torder);
        try {
            tx = session.beginTransaction();
            Sreservation.setSstate(0);
            Sreservation.setTorder(Torder);
            Sreservation.setTeacherId(treservationEntity.getTeacherId());
            session.save(Sreservation);
            session.flush();
            tx.commit();
                                            //不确定flush是否可以得到自增id
            tx = session.beginTransaction();
            treservationEntity.setSorder(Sreservation.getSorder());
            if(treservationEntity.getTstate() == 4){
                treservationEntity.setTstate(0);
            }
            session.save(treservationEntity);
            session.flush();
            tx.commit();
        }catch (Exception e){
            SessionCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
    }

    public SreservationEntity get(int Sorder){           //获取教授某条预约信息(学生部分)
        Session session = SessionCon.currentSession();
        try{
            String hql = "from SreservationEntity where sorder=" +Sorder;
            List list = session.createQuery(hql).list();
            return (SreservationEntity) list.iterator().next();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return null;
    }

    public List getAll(String id){           //获取某教授或学生全部请求预约信息(学生部分信息)
        Session session = SessionCon.currentSession();
        try{
            String hql = "from UsersEntity where id='" + id + "'";
            List list = session.createQuery(hql).list();
            UsersEntity usersEntity = (UsersEntity) list.iterator().next();
            if(usersEntity.getType() == 1) {
                hql = "from SreservationEntity where teacherId='" + id + "'";
            }
            else {
                hql = "from SreservationEntity where studentId='" + id + "'";
            }
            list = session.createQuery(hql).list();
            return  list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return null;
    }
}
