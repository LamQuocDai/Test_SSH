/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Utils.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import BLL.Member;
/**
 *
 * @author USER
 */
public class MemberDAL {
    Session session ;
    
    public MemberDAL(){
        this.session = HibernateUtil.getSessionFactory().openSession();
    }
    public int addMember(Member member) {
          try{
              this.session.beginTransaction();
              this.session.save(member);
              this.session.getTransaction().commit();
              return 1;
          }
          catch(Exception e){
              System.out.println(e);
              return 0;
          }
    }
}
