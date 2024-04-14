package GUI;

import Utils.HibernateUtil;
import BLL.Device;
import BLL.Member;
import Utils.HibernateUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.NativeQuery;

/**
 *
 * @author thinkphat
 */
public class TestHibernate {
    
    public static String initMaTV(String faculty, String field) {
        String total = "";
        switch (field) {
            case "cong nghe thong tin":
                total += 20;
                break;
            case "kinh doanh":
                total += 57;
                break;
            case "su pham":
                total += 60;
                break;
        }
        switch (faculty) {
            case "cong nghe thong tin":
                total += 15;
                break;
            case "quan tri kinh doanh":
                total += 16;
                break;
            case "su pham anh":
                total += 17;
                break;
            case "ky thuat phan mem":
                total += 14;
                break;
        }
//        HibernateConfig config = new HibernateConfig();
//        SessionFactory sessionFactory = config.getSessionFactory1();
//
//        // Tạo một đối tượng entity mới
////        Member member = new Member("Nguyen Thinh Thinh", "cong nghe thong tin", "ky thuat phan mem", 123131231);
//        Long a = null;
//        // Mở một phiên làm việc với cơ sở dữ liệu
//        try (Session session = sessionFactory.openSession()) {
//            // Bắt đầu một giao dịch
//            NativeQuery query = session.createSQLQuery("SELECT next_val FROM thanhvien_sequence WHERE 1");
//            
//            a = ((Number) query.uniqueResult()).longValue();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            // Đóng SessionFactory khi không cần nữa
//            sessionFactory.close();
//        }
        
        return "11" + total;
    }
    public static void main(String[] args) {
        String memberId = "";
        memberId += String.format("%04d", 22 + 1);
        System.out.println("aaaa "+memberId);

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
//            NativeQuery query = session.createSQLQuery("SELECT next_val FROM thanhvien_sequence WHERE 1");
//            
//            a = ((Number) query.uniqueResult()).longValue();
            // Tạo một đối tượng entity mới
//            Member member = new Member("Nguyen Thinh Phat", "cong nghe thong tin", "ky thuat phan mem", 123131231);
//             Thiết lập các giá trị cho đối tượng entity nếu cần
//            member.setMaTV(Long.parseLong(a));
            // Lưu đối tượng entity vào cơ sở dữ liệu
            
            Member member = new Member();
            member.setField("Cong nghe thong tin");
            member.setFaculty("Cong nghe thong tin");
            member.setName("Nguyen Thinh Phat");
            member.setPhoneNumber(312931032);
            member.setId(Long.parseLong("12331"));
            session.save(member);

            // Commit giao dịch để lưu các thay đổi vào cơ sở dữ liệu
            transaction.commit();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng SessionFactory khi không cần nữa
            HibernateUtil.close();
        }
    }
}
