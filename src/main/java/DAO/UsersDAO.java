package DAO;

import Entity.UsersEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import SessionHelper.SessionCon;

import java.util.ArrayList;
import java.util.List;

public class UsersDAO {
    private Transaction tx;

    public UsersDAO() {
    }

    public void create(UsersEntity user) throws RuntimeException {   //新增用户
        Session session = SessionCon.currentSession();
        try {
            tx = session.beginTransaction();
            session.save(user);
            session.flush();
            tx.commit();
        } catch (Exception e) {
            SessionCon.rollback(tx);
            e.printStackTrace();
        } finally {
            SessionCon.closeSession();
        }
    }

    public void update(UsersEntity user) {                   //更新用户信息
        Session session = SessionCon.currentSession();
        try {
            tx = session.beginTransaction();
            session.update(user);
            tx.commit();
        } catch (Exception e) {
            SessionCon.rollback(tx);
            e.printStackTrace();
        } finally {
            SessionCon.closeSession();
        }
    }

    public Boolean find(String id) {                         //判断用户存在
        Session session = SessionCon.currentSession();
        try {
            String hql = "from UsersEntity where id='" + id + "'";
            Query query = session.createQuery(hql);
            if (!query.list().isEmpty()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionCon.closeSession();
        }
        return false;
    }

    public Boolean login(UsersEntity user) {       //登录验证
        Session session = SessionCon.currentSession();
        try {
            String hql = "select password from UsersEntity where id='" + user.getId() + "'";
            List list = session.createQuery(hql).list();
            if (!list.isEmpty()) {
                if (list.iterator().next().equals(user.getPassword())) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionCon.closeSession();
        }
        return false;
    }

    public UsersEntity get(String id) {                      //通过id获取用户信息
        Session session = SessionCon.currentSession();
        try {
            String hql = "from UsersEntity where id='" + id + "'";
            List list = session.createQuery(hql).list();
            return (UsersEntity) list.iterator().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionCon.closeSession();
        }
        return null;
    }

    public List getTeacher(String name){               //通过名字查找老师
        Session session = SessionCon.currentSession();
        try {
            String hql = "from UsersEntity where name='" + name + "'";
            return session.createQuery(hql).list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionCon.closeSession();
        }
        return null;
    }

    public Boolean delete(UsersEntity user) {                   //删除用户信息
        Session session = SessionCon.currentSession();
        try {
            tx = session.beginTransaction();
            session.delete(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            SessionCon.rollback(tx);
            e.printStackTrace();
        } finally {
            SessionCon.closeSession();
        }
        return false;
    }
}
