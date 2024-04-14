/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BLL;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.Data;

/**
 *
 * @author thinkphat
 */
@Data
@Entity
@Table(name = "thongtinsd")
public class UsageInfomation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaTT", nullable = false)
    private Long id;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "MaTV", nullable = false, foreignKey = @ForeignKey(name = "fk_thongtinsd_thanhvien"))
    private Member member;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "MaTB", nullable = true, foreignKey = @ForeignKey(name = "fk_thongtinsd_thietbi"))
    private Device device;
    
    @Column(name = "TGVao")
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date enterTime;
    
    @Column(name = "TGMuon")
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date borrowTime;
    
    @Column(name = "TGTra", nullable = true)
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date returnTime;
}
