package com.netaji.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

//Entity class
@Entity
@Table(name = "image_table")
public class Image {
 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;
 private String name;
 @Lob
 private byte[] data;
 
 
	/*
	 * @OneToOne(fetch = FetchType.LAZY, optional = false)
	 * 
	 * @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
	 * private User user;
	 */
 
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
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
 
 
 
 
 // getters and setters
}