package DAO;

import Entity.UsersEntity;
import SessionHelper.SessionCon;
import org.hibernate.Session;
import org.hibernate.Transaction;
import Entity.FollowEntity;
import java.util.ArrayList;
import java.util.List;

public class FollowDAO {
    private Transaction tx;

    public FollowDAO(){

    }
    public ArrayList getfollow(String id){                  //返回关注列表
        UsersDAO usersDAO = new  UsersDAO();
        String sql;
        if(usersDAO.get(id).getType()==1){
            sql = "select follower from FollowEntity where followed='"+id+"'";
        }
        else{
            sql = "select followed from FollowEntity where follower='"+id+"'";
        }
        Session session = SessionCon.currentSession();
        try{
            List list = session.createQuery(sql).list();
            ArrayList<UsersEntity> arrayList = new ArrayList<>();
            for(Object o : list){
                arrayList.add(usersDAO.get((String)o));
            }
            return arrayList;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return null;
    }

    public int isfollow(String id, String teacherId){      //查询是否关注，1为已关注
        Session session = SessionCon.currentSession();
        try{
            String sql = "from FollowEntity where follower='"+id+"' and followed='"+teacherId+"'";
            return session.createQuery(sql).list().isEmpty()?0:1;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
        return 0;
    }

    public void add(String id, String teacherId){           //关注
        FollowEntity followEntity = new FollowEntity();
        followEntity.setFollower(id);
        followEntity.setFollowed(teacherId);
        UsersDAO usersDAO = new UsersDAO();
        UsersEntity studentUsers = usersDAO.get(id);
        studentUsers.setFollowNum(studentUsers.getFollowNum()+1);
        UsersEntity teacherUsers = usersDAO.get(teacherId);
        teacherUsers.setFollowNum(teacherUsers.getFollowNum()+1);
        Session session = SessionCon.currentSession();
        try{
            tx = session.beginTransaction();
            session.update(studentUsers);
            session.update(teacherUsers);
            session.save(followEntity);
            tx.commit();
        }catch (Exception e){
            SessionCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
    }

    public void delete(String id, String teacherId){           //取关
        UsersDAO usersDAO = new UsersDAO();
        UsersEntity studentUsers = usersDAO.get(id);
        studentUsers.setFollowNum(studentUsers.getFollowNum()-1);
        UsersEntity teacherUsers = usersDAO.get(teacherId);
        teacherUsers.setFollowNum(teacherUsers.getFollowNum()-1);
        Session session = SessionCon.currentSession();
        try{
            tx = session.beginTransaction();
            String sql = "from FollowEntity where follower='"+id+"' and followed='"+teacherId+"'";
            FollowEntity followEntity = (FollowEntity) session.createQuery(sql).list().iterator().next();
            session.update(studentUsers);
            session.update(teacherUsers);
            session.delete(followEntity);
            tx.commit();
        }catch (Exception e){
            SessionCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
    }
}
