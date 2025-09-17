package vn.silver.Entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
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

@Entity
@Table(name = "Videos")
@NamedQuery(name = "Video.findAll", query = "SELECT c FROM Video c")
public class Video implements Serializable {
	private static final long serialVersionUID = 1L;
	
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int id;
		
		@Column(name = "Tenvideo", columnDefinition = "NVARCHAR(255)")
		private String tenvideo;
		
		@Column(name = "Duongdanvideo", columnDefinition = "NVARCHAR(255)")
		private String video;
		
		
	}

