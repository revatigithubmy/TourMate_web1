package com.revati.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "travelpackage")
public class TravelPackage {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int package_id;
	private String package_name;
	private String location;
	private String description;
	private double price;
	private int guide_id;
	private String guide_name;
	private int duration;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
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
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	@Override
	public String toString() {
		return "TravelPackage [package_id=" + package_id + ", package_name=" + package_name + ", location=" + location
				+ ", description=" + description + ", price=" + price + ", guide_id=" + guide_id + ", guide_name="
				+ guide_name + ", duration=" + duration + "]";
	}
	public TravelPackage(int package_id, String package_name, String location, String description, double price,
			int guide_id, String guide_name, int duration) {
		super();
		this.package_id = package_id;
		this.package_name = package_name;
		this.location = location;
		this.description = description;
		this.price = price;
		this.guide_id = guide_id;
		this.guide_name = guide_name;
		this.duration = duration;
	}
	public TravelPackage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
