package com.fdmgroup.entity;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "PM_PROFILE")
@NamedQueries({ @NamedQuery(name = "Profile.findByUserId", query = "SELECT p FROM Profile p WHERE p.user.id=:uId"),
		@NamedQuery(name = "Profile.findByEmail", query = "SELECT p FROM Profile p WHERE p.user.email=:uEmail") })

public class Profile implements IStorable {

	@Id
	@Column(name = "profile_id", nullable = false)
	@SequenceGenerator(name = "pm_profile_sequence", sequenceName = "PM_PROFILE_SEQ", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pm_profile_sequence")
	private long id;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private User user;

	@Column(name = "birth_date")
	private Date birthdate;

	@Column(name = "address", length = 128)
	private String address;

	@Column(name = "primary_phone", length = 32)
	private String primaryPhone;

	@Column(name = "secondary_phone", length = 32)
	private String secondaryPhone;

	@Column(name = "diseases")
	private String diseases;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private FileEntity picture;

	public Profile() {
		this(null, null, null, null, null, null);
	}

	public Profile(User user, Date birthdate, String address, String primaryPhone, String secondaryPhone,
			String diseases) {
		super();
		this.user = user;
		this.birthdate = birthdate;
		this.address = address;
		this.primaryPhone = primaryPhone;
		this.secondaryPhone = secondaryPhone;
		this.diseases = diseases;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPrimaryPhone() {
		return primaryPhone;
	}

	public void setPrimaryPhone(String primaryPhone) {
		this.primaryPhone = primaryPhone;
	}

	public String getSecondaryPhone() {
		return secondaryPhone;
	}

	public void setSecondaryPhone(String secondaryPhone) {
		this.secondaryPhone = secondaryPhone;
	}

	public String getDiseases() {
		return diseases;
	}

	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}

	public FileEntity getPicture() {
		return picture;
	}

	public void setPicture(FileEntity picture) {
		this.picture = picture;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Profile other = (Profile) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Profile [id=" + id + ", user=" + user + ", birthdate=" + birthdate + ", address=" + address
				+ ", primaryPhone=" + primaryPhone + ", secondaryPhone=" + secondaryPhone + ", diseases=" + diseases
				+ ", picture=" + picture + "]";
	}


}
