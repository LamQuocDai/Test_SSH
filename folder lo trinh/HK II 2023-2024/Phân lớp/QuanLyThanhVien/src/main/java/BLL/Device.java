package BLL;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


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
import lombok.Data;

/**
 *
 * @author thinkphat
 */
@Data
@Entity
@Table(name = "thietbi",schema = "BLL")
public class Device {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "thietbi_sequence")
    @SequenceGenerator(name = "thietbi_sequence", sequenceName = "thietbi_sequence", allocationSize = 1, initialValue = 1000004)
    @Column(name = "MaTB")
    private Long id;
    
    @Column(name = "TenTB")
    private String deviceName;
    
    @Column(name = "MoTaTB")
    private String description;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "device")
    private Set<UsageInfomation> usageInfomations;
}
