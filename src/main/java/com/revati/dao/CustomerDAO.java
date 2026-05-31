package com.revati.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.revati.model.Booking;
import com.revati.model.Customer;
import com.revati.model.Guide;

@Component
public class CustomerDAO {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

	 // Insert new customer
    @Transactional
    public int addCustomer(Customer customer)
    {
        return (int) hibernateTemplate.save(customer);
    }

    
 //  Update customer
    @Transactional
    public void updateCustomer(Customer customer) {
        hibernateTemplate.update(customer);
    }

 //  Get single customer by ID
    @Transactional
    public Customer getCustomerById(int id) {
        return hibernateTemplate.get(Customer.class, id);
    }

 //  Get all customer
    @Transactional
    public List<Customer> getAllCustomer() {
        return hibernateTemplate.loadAll(Customer.class);
    }
	    
 //Get single customer by email (using named parameter)
    @Transactional
    public Customer getCustomerByEmail(String email) {
        List<Customer> customer = (List<Customer>) hibernateTemplate.findByNamedParam(
            "from Customer where email = :email", "email", email
        );
        if (customer != null && !customer.isEmpty()) {
            return customer.get(0);
        }
        return null;
    }
   
}



