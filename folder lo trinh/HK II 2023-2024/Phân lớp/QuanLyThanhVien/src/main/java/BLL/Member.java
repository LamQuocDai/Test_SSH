/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BLL;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author thinkphat
 */
@Data
@Entity
@Table(name = "thanhvien", schema = "BLL")
public class Member {

    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "thanhvien_sequence")
//    @SequenceGenerator(name = "thanhvien_sequence", sequenceName = "thanhvien_sequence", allocationSize = 1, initialValue = 1000)
    @Column(name = "MaTV")
    private Long id;
    
    @Column(name = "HoTen")
    private String name;
    @Column(name = "Khoa")
    private String faculty;
    @Column(name = "Nganh")
    private String field;
    @Column(name = "SDT")
    private String phoneNumber;

    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    private Set<UsageInfomation> usageInfomations;
    
    @OneToMany(mappedBy = "member",fetch = FetchType.LAZY)
    private Set<Handle> handles;
    
}
