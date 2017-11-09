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
            tx = session.beginTransaction();
            UsersDAO usersDAO = new UsersDAO();
            UsersEntity usersEntity = usersDAO.get(id);
            String hql;
            if(usersEntity.getType() == '1') {
                hql = "from SreservationEntity where teacherId='" + id + "'";
            }
            else {
                hql = "from SreservationEntity where studentId='" + id + "'";
            }
            List list = session.createQuery(hql).list();
            tx.commit();
            return list;
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
        return null;
    }
}
