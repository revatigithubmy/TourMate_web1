package com.revati.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.revati.model.TravelPackage;

@Component
public class PackageDAO {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	// Add new Travel Package
	@Transactional
	public int addPackage(TravelPackage travelPackage) {
	    return (int) hibernateTemplate.save(travelPackage);
	}


	// Update Package
	@Transactional
	public void updatePackage(TravelPackage travelPackage) {
		hibernateTemplate.update(travelPackage);
	}

	// Delete Package by ID
	@Transactional
	public void deletePackage(int id) {
		TravelPackage travelPackage = hibernateTemplate.get(TravelPackage.class, id);
		if (travelPackage != null) {
			hibernateTemplate.delete(travelPackage);
			System.out.println("Package deleted successfully.");
		} else {
			System.out.println("Package not found — nothing deleted.");
		}
	}
	
	 //  Get Single Package by ID
	@Transactional
    public TravelPackage getPackageById(int id) {
        return hibernateTemplate.get(TravelPackage.class, id);
    }
	 //  Get All Packages
	 @Transactional
	    public List<TravelPackage> getAllPackages() {
	        return hibernateTemplate.loadAll(TravelPackage.class);
	    }
    
    
    public List<TravelPackage> searchPackages(String location, double maxPrice) {
        String query = "from TravelPackage where price <= ?1";
        if (location != null && !location.isEmpty()) {
            query += " and location like ?2";
            return (List<TravelPackage>) hibernateTemplate.find(query, maxPrice, "%" + location + "%");
        } else {
            return (List<TravelPackage>) hibernateTemplate.find(query, maxPrice);
        }
    }

}
