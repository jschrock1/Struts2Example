package org.koushik.javabrains.dto;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 * Test Hibernate model class, we are going to use annotations 
 */

// @Entity tells hibernate to use this class to create the table.
@Entity 
@Table (name="USER_DETAILS")
public class UserDetails {
	
	// Tells Hibernate to use this as primary key
	@Id 
	private int userId;
	// @Basic @Transient will tell hibernate not to add this column
	private String userName;	
	@Temporal (TemporalType.DATE)  // gets rid of timestamp, keeps the date
	private Date joinedDate;
	private String address;
	//@Lob
	private String description;
	
	public Date getJoinedDate() {
		return joinedDate;
	}
	public void setJoinedDate(Date joinedDate) {
		this.joinedDate = joinedDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}


}
