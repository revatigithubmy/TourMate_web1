package com.revati.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Booking {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int booking_id;
	private int customer_id;
	private String customer_name;
	private int package_id;
	private String package_name; // ✅ New
	private int guide_id;
	private String guide_name; // ✅ New
	private Date booking_date;
	private String status;
	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Booking(int booking_id, int customer_id, String customer_name, int package_id, String package_name,
			int guide_id, String guide_name, Date booking_date, String status) {
		super();
		this.booking_id = booking_id;
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.package_id = package_id;
		this.package_name = package_name;
		this.guide_id = guide_id;
		this.guide_name = guide_name;
		this.booking_date = booking_date;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Booking [booking_id=" + booking_id + ", customer_id=" + customer_id + ", customer_name=" + customer_name
				+ ", package_id=" + package_id + ", package_name=" + package_name + ", guide_id=" + guide_id
				+ ", guide_name=" + guide_name + ", booking_date=" + booking_date + ", status=" + status + "]";
	}
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public int getPackage_id() {
		return package_id;
	}
	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public int getGuide_id() {
		return guide_id;
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
	public Date getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
