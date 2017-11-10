package DAO;

import Entity.ReservationEntity;
import Entity.SreservationEntity;
import Entity.TreservationEntity;
import Entity.UsersEntity;
import java.util.ArrayList;

public class ReservationDA0 {
    public ReservationDA0(){
    }

    public ArrayList get(String id, int state){     //获取某教授或学生全部预约（教授部分+学生部分）
        UsersDAO usersDAO = new UsersDAO();
        SreservationDAO sreservationDAO = new SreservationDAO();
        TreservationDAO treservationDAO = new TreservationDAO();
        ReservationEntity reservationEntity = new ReservationEntity();
        ArrayList<ReservationEntity> arrayList = new ArrayList<>();
        for (Object o : sreservationDAO.getAll(id)) {
            SreservationEntity sreservationEntity = (SreservationEntity) o;
            reservationEntity.setSreservationEntity(sreservationEntity);
            TreservationEntity treservationEntity = treservationDAO.get(sreservationEntity.getTorder());
            reservationEntity.setTreservationEntity(treservationEntity);
            UsersEntity usersEntity = usersDAO.get(sreservationEntity.getStudentId());
            reservationEntity.setUsersEntity(usersEntity);
            if(usersDAO.get(id).getType() == 1 && treservationEntity.getTstate() == state){
                arrayList.add(reservationEntity);
            }
            if(usersDAO.get(id).getType() == 0 && sreservationEntity.getSstate() == state){
                arrayList.add(reservationEntity);
            }
        }
        return arrayList;
    }
}
