package DAO;

import Entity.UsersEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

public class UsersDAO {
    private Transaction tx;
    public UsersDAO(){
    }
    public void create(UsersEntity user) throws RuntimeException{   //
        Session session = SQLCon.currentSession();
        try{
            tx = session.beginTransaction();
            System.out.println(user.getName());
            session.save(user);
            System.out.println(user.getId());
            System.out.println(user.getPassword());
            session.flush();
            tx.commit();
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
    }

    public void update(UsersEntity user){                   //更新用户信息
        Session session = SQLCon.currentSession();
        try{
            tx = session.beginTransaction();
            session.update(user);
            tx.commit();
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
    }

    public Boolean find(String id){                         //判断用户存在
        Session session = SQLCon.currentSession();
        try{
            tx = session.beginTransaction();
            String hql = "from UsersEntity where id='"+id+"'";
            Query query = session.createQuery(hql);
            if(!query.list().isEmpty()) {
                tx.commit();
                return true;
            }
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
        return false;
    }

    public Boolean login(UsersEntity user){       //登录验证
        Session session = SQLCon.currentSession();
        try{
            tx = session.beginTransaction();
            String hql = "select password from UsersEntity where id='"+user.getId()+"'";
            List list = session.createQuery(hql).list();
            if(!list.isEmpty()){
                if(list.iterator().next().equals(user.getPassword())){
                    return true;
                }
            }
            tx.commit();
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
        return false;
    }

    public UsersEntity get(String id){                      //获取用户信息
        Session session = SQLCon.currentSession();
        try {
            tx = session.beginTransaction();
            String hql = "from UsersEntity where id='" + id + "'";
            List list = session.createQuery(hql).list();
            UsersEntity user = (UsersEntity) list.iterator().next();
            tx.commit();
            return user;
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
        return null;
    }

    public void delete(UsersEntity user){                   //删除用户信息
        Session session = SQLCon.currentSession();
        try{
            tx = session.beginTransaction();
            session.delete(user);
            tx.commit();
        }catch (Exception e){
            SQLCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SQLCon.closeSession();
        }
    }
}
