package com.revati.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Guide {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int guide_id;
	private String guide_name;
	private String email;
	private String password;
	private String phone;
	private String language;
	private String experience;
	public int getGuide_id() {
		return guide_id;
	}
	public Guide() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Guide(int guide_id, String guide_name, String email, String password, String phone, String language,
			String experience) {
		super();
		this.guide_id = guide_id;
		this.guide_name = guide_name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.language = language;
		this.experience = experience;
	}
	@Override
	public String toString() {
		return "Guide [guide_id=" + guide_id + ", guide_name=" + guide_name + ", email=" + email + ", password="
				+ password + ", phone=" + phone + ", language=" + language + ", experience=" + experience + "]";
	}
	public void setGuide_id(int guide_id) {
		this.guide_id = guide_id;
	}
	public String getGuide_name() {
		return guide_name;
	}
	public void setGuide_name(String guide_name) {
		this.guide_name = guide_name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}

}
