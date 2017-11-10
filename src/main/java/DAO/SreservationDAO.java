package DAO;

import Entity.SreservationEntity;
import Entity.UsersEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sqlHelper.SQLCon;

import java.util.List;

public class SreservationDAO {
    private Transaction tx;

    public SreservationDAO(){

    }

    public void create(SreservationEntity Sreservation) throws RuntimeException{    //新增请求预约信息
        Session session = SQLCon.currentSession();
        try {
            tx = session.beginTransaction();
            session.save(Sreservation);
            session.flush();
            tx.commit();
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
    }

    public List get(String id){           //获取某教授或学生全部请求预约信息(学生部分信息)
        Session session = SQLCon.currentSession();
        try{
            String hql = "from UsersEntity where id='" + id + "'";
            List list = session.createQuery(hql).list();
            UsersEntity usersEntity = (UsersEntity) list.iterator().next();
            if(usersEntity.getType() == 1) {
                hql = "from SreservationEntity where teacherId='" + id + "'";
            }
            else {
                System.out.println(id);
                hql = "from SreservationEntity where studentId='" + id + "'";
            }
            list = session.createQuery(hql).list();
            return  list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
        return null;
    }
}
