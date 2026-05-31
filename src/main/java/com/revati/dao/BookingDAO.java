package com.revati.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.revati.model.Booking;
import com.revati.model.TravelPackage;

@Component
public class BookingDAO {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	  public void saveBooking(Booking booking) {
	        hibernateTemplate.save(booking);
	    }


	// Add new Booking
	@Transactional
	public int addBooking(Booking booking) {
		return (int) hibernateTemplate.save(booking);
	}

	// Update Booking
	@Transactional
	public void updateBooking(Booking booking) {
		hibernateTemplate.update(booking);
	}

	// Delete Booking by ID
	@Transactional
	public void deleteBooking(int id) {
		Booking booking = hibernateTemplate.get(Booking.class, id);
		if (booking != null) {
			hibernateTemplate.delete(booking);
			System.out.println("Booking deleted successfully.");
		} else {
			System.out.println("Booking not found — nothing deleted.");
		}
	}

	@Transactional
	// Get single Booking by ID
	public Booking getBookingById(int id) {
		return hibernateTemplate.get(Booking.class, id);
	}

	@Transactional
	// Get all Bookings
	public List<Booking> getAllBookings() {
		return hibernateTemplate.loadAll(Booking.class);
	}

	
	@Transactional
	public List<Booking> getBookingsByCustomerId(int customerId) {
	    String hql = "from Booking where customer_id = :customerId";
	    return (List<Booking>) hibernateTemplate.findByNamedParam(hql, "customerId", customerId);
	}


	
	@Transactional
	public List<Booking> searchBookingsByGuideAndFilters(int guideId, String status, String packageName) {
	    StringBuilder query = new StringBuilder("from Booking where guide_id = :guideId");
	    
	    if (status != null && !status.isEmpty()) {
        query.append(" and status = :status");
      }
    if (packageName != null && !packageName.isEmpty()) {
	        query.append(" and package_name like :packageName");
	    }

	    // Use query map to bind parameters dynamically
	    org.springframework.orm.hibernate5.support.HibernateDaoSupport support =
	        new org.springframework.orm.hibernate5.support.HibernateDaoSupport() {
	            { setHibernateTemplate(hibernateTemplate); }
	        };

	    return (List<Booking>) hibernateTemplate.execute(session -> {
	        org.hibernate.query.Query<Booking> q = session.createQuery(query.toString(), Booking.class);
	        q.setParameter("guideId", guideId);
	        
	        if (status != null && !status.isEmpty()) {
	            q.setParameter("status", status);
	        }
	        if (packageName != null && !packageName.isEmpty()) {
	            q.setParameter("packageName", "%" + packageName + "%");
	        }

	        return q.getResultList();
	    });
	}
	
               
	
	
	@Transactional
	public void bookPackage(int customerId, String customerName, int packageId) {
	    String hql = "FROM TravelPackage WHERE package_id = ?";
	    List<TravelPackage> packages = (List<TravelPackage>) hibernateTemplate.find(hql, packageId);

	    if (!packages.isEmpty()) {
	        TravelPackage tp = packages.get(0);

	        Booking booking = new Booking();
	        booking.setCustomer_id(customerId);
	        booking.setCustomer_name(customerName);
	        booking.setPackage_id(packageId);
	        booking.setPackage_name(tp.getPackage_name());

	        // ✅ Set both
	        booking.setGuide_id(tp.getGuide_id());
	        booking.setGuide_name(tp.getGuide_name());

	        booking.setBooking_date(new java.sql.Date(System.currentTimeMillis()));
	        booking.setStatus("Pending");

	        hibernateTemplate.save(booking);
	    }
	}

	
	
	 // ✅ This method now fetches directly the booking with package & guide names
	@Transactional
    public List<Booking> viewMyBookings(int customerId) {
        String hql = "FROM Booking WHERE customer_id = ?";
        return (List<Booking>) hibernateTemplate.find(hql, customerId);
    }

	// ✅ Fetch all bookings for admin (with package & customer details)
	@Transactional
	public List<Booking> viewAllBookings() {
	    String hql = "FROM Booking";
	    return (List<Booking>) hibernateTemplate.find(hql);
	}

	
	// ✅ Fetch bookings for specific guide (fixed for Hibernate 5+)
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Booking> getBookingsByGuideId(int guideId) {
	    String hql = "from Booking where guide_id = :guideId";
	    return (List<Booking>) hibernateTemplate.findByNamedParam(hql, "guideId", guideId);
	}


    // Update booking status
    public void updateBookingStatus(int bookingId, String status) {
        Booking booking = hibernateTemplate.get(Booking.class, bookingId);
        if (booking != null) {
            booking.setStatus(status);
            hibernateTemplate.update(booking);
        }
    }

	

}
