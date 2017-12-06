package DAO;

import Entity.ReservationEntity;
import Entity.SreservationEntity;
import Entity.TreservationEntity;
import Entity.UsersEntity;

import java.util.ArrayList;
import java.util.Date;

public class ReservationDA0 {
    public ReservationDA0() {
    }

    public ArrayList get(String id, int state) {     //获取某教授或学生全部某状态预约（教授部分+学生部分）
        UsersDAO usersDAO = new UsersDAO();
        SreservationDAO sreservationDAO = new SreservationDAO();
        TreservationDAO treservationDAO = new TreservationDAO();
        ArrayList<ReservationEntity> arrayList = new ArrayList<>();
        for (Object o : sreservationDAO.getAll(id)) {
            ReservationEntity reservationEntity = new ReservationEntity();
            SreservationEntity sreservationEntity = (SreservationEntity) o;
            reservationEntity.setSreservationEntity(sreservationEntity);
            TreservationEntity treservationEntity = treservationDAO.get(sreservationEntity.getTorder());
            reservationEntity.setTreservationEntity(treservationEntity);
            UsersEntity usersEntity;
            //获取预约对象
            if (usersDAO.get(id).getType() == 1) {
                usersEntity = usersDAO.get(sreservationEntity.getStudentId());
            } else {
                usersEntity = usersDAO.get(sreservationEntity.getTeacherId());
            }
            reservationEntity.setUsersEntity(usersEntity);
            //添加某状态信息
            if (sreservationEntity.getSstate() == state) {
                arrayList.add(reservationEntity);
            }
        }
        return arrayList;
    }

    public ArrayList getOnedayNotnull(Date date, String teacherID) {     //获取某教授某日已确定预约
        SreservationDAO sreservationDAO = new SreservationDAO();
        TreservationDAO treservationDAO = new TreservationDAO();
        UsersDAO usersDAO = new UsersDAO();
        ArrayList<ReservationEntity> arrayList = new ArrayList<>();
        for (Object o : treservationDAO.getOnedayNotnull(date, teacherID)) {
            ReservationEntity reservationEntity = new ReservationEntity();
            TreservationEntity treservationEntity = (TreservationEntity) o;
            reservationEntity.setTreservationEntity(treservationEntity);
            SreservationEntity sreservationEntity = sreservationDAO.get(treservationEntity.getSorder());
            reservationEntity.setSreservationEntity(sreservationEntity);
            //预约对象只能是学生
            UsersEntity usersEntity = usersDAO.get(sreservationEntity.getStudentId());
            reservationEntity.setUsersEntity(usersEntity);
            arrayList.add(reservationEntity);
        }
        return arrayList;
    }
}
