package com.revati.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.revati.model.Customer;
import com.revati.model.Guide;

@Component
public class GuideDAO {

	 @Autowired
	    private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	 // Insert new Guide
    @Transactional
    public int addGuide(Guide guide)
    {
        return (int) hibernateTemplate.save(guide);
    }
    
    //  Delete Guide by ID
    @Transactional
    public void deleteGuide(int id) {
        Guide guide = hibernateTemplate.get(Guide.class, id);
        if (guide != null) {
            hibernateTemplate.delete(guide);
            System.out.println("Tour Guide deleted successfully.");
        } else {
            System.out.println("Tour Guide not found — nothing deleted.");
        }
    }
    
 //  Update guide
    @Transactional
    public void updateGuide(Guide guide) {
        hibernateTemplate.update(guide);
    }

 //  Get single guide by ID
    @Transactional
    public Guide getGuideById(int id) {
        return hibernateTemplate.get(Guide.class, id);
    }

 //  Get all guides
    @Transactional
    public List<Guide> getAllGuides() {
        return hibernateTemplate.loadAll(Guide.class);
    }
	    
 //Get single customer by email (using named parameter)
    @Transactional
    public Guide getGuideByEmail(String email) {
        List<Guide> guide = (List<Guide>) hibernateTemplate.findByNamedParam(
            "from Guide where email = :email", "email", email);
        if (guide != null && !guide.isEmpty()) {
            return guide.get(0);
        }
        return null;
    }
}
