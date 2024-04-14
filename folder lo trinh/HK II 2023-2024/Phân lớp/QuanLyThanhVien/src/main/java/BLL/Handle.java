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
@Table(name = "xuly", schema = "BLL")
public class Handle {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaXL", nullable = false)
    Long id;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "MaTV", nullable = false, foreignKey = @ForeignKey (name="fk_xuly_thanhvien"))
    private Member member;
    
    @Column(name = "HinhThucXL", nullable = true)
    private String processingForm;
    
    @Column(name = "SoTien",nullable = true)
    private int money;
    
    @Column(name = "NgayXL", nullable = true)
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date processingDate;
    
    @Column(name = "TrangThaiXL", nullable = true)
    private int processingStatus;
    
    
    
}
