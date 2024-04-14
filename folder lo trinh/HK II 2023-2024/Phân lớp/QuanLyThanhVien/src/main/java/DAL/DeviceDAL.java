package DAL;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import Utils.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import BLL.Device;

/**
 *
 * @author USER
 */
public class DeviceDAL {
        Session session ;
    
    public DeviceDAL(){
        this.session = HibernateUtil.getSessionFactory().openSession();
    }
    public int addDevice(Device device) {
          try{
              this.session.beginTransaction();
              this.session.save(device);
              this.session.getTransaction().commit();
              return 1;
          }
          catch(Exception e){
              return 0;
          }
    }
}
