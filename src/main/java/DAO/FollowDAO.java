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

    public void add(String id, String teacherId, int followType){           //关注
        FollowEntity followEntity = new FollowEntity();
        UsersDAO usersDAO = new UsersDAO();
        UsersEntity studentUsers = usersDAO.get(id);
        UsersEntity teacherUsers = usersDAO.get(teacherId);
        Session session = SessionCon.currentSession();
        try{
            tx = session.beginTransaction();
            if(followType == 1) {
                studentUsers.setFollowNum(studentUsers.getFollowNum() + 1);
                teacherUsers.setFollowNum(teacherUsers.getFollowNum() + 1);
                followEntity.setFollower(id);
                followEntity.setFollowed(teacherId);
                session.save(followEntity);
            }
            else{
                studentUsers.setFollowNum(studentUsers.getFollowNum() - 1);
                teacherUsers.setFollowNum(teacherUsers.getFollowNum() - 1);
                String sql = "from FollowEntity where follower='"+id+"' and followed='"+teacherId+"'";
                followEntity = (FollowEntity) session.createQuery(sql).list().iterator().next();
                session.delete(followEntity);

            }
            session.update(studentUsers);
            session.update(teacherUsers);
            tx.commit();
        }catch (Exception e){
            SessionCon.rollback(tx);
            e.printStackTrace();
        }finally {
            SessionCon.closeSession();
        }
    }

}
