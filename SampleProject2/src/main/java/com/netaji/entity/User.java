package com.netaji.entity;

import java.beans.Transient;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	private String username;
	private String email;
	private String password;

	private String fileName;

	@Lob
	private byte[] photos;
	
	
	
	 private String name;
	 @Lob
	 private byte[] data;
	

	/*
	 * @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch =
	 * FetchType.LAZY) private Image image;
	 */
	public User() {
		super();
	}

	public User(Long id, String username, String email, String password, String fileName, byte[] photos) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.fileName = fileName;

		this.photos = photos;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getPhotos() {
		return photos;
	}

	public void setPhotos(byte[] photos) {
		this.photos = photos;
	}
	
	
	
	
	

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	@Transient
	public String getImage() {
		if (fileName == null || id == null)
			return null;

		return "/File-name/" + id + "/" + fileName;
	}

}
