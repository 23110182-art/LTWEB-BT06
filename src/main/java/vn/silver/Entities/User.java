package vn.silver.Entities;

import java.io.Serializable;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter

@Entity(name = "Users")   // đặt tên entity là Users
@Table(name = "Users")
@NamedQuery(name = "User.findAll", query = "SELECT c FROM Users c")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "Taikhoan", columnDefinition = "NVARCHAR(255)")
	private String taikhoan;
	@Column(name = "Matkhau", columnDefinition = "NVARCHAR(255)")
	private String matkhau;
	
	@Column(name = "Email", columnDefinition = "NVARCHAR(255)")
	private String email;
	

	@Column(name = "Sodienthoai", columnDefinition = "NVARCHAR(255)")
	private String phone;
	
	@Column(name = "Bietdanh", columnDefinition = "NVARCHAR(255)")
	private String bietdanh;
	
	@Column(name = "Hinhdaidien", columnDefinition = "NVARCHAR(255)")
	private String avatar;
	
	@Column(name = "Vaitro")
	private int roleId;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    
	private Set<Category> categories;

	public User(String taikhoan, String matkhau, String email, String phone, String bietdanh, int roleId) {
		super();
		this.taikhoan = taikhoan;
		this.matkhau = matkhau;
		this.email = email;
		this.phone = phone;
		this.bietdanh = bietdanh;
		this.roleId = roleId;
	}

	
	
	
}
