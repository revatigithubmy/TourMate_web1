package com.revati.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.revati.dao.BookingDAO;
import com.revati.dao.CustomerDAO;
import com.revati.dao.PackageDAO;
import com.revati.model.Booking;
import com.revati.model.Customer;
import com.revati.model.Guide;
import com.revati.model.TravelPackage;

@Controller
public class CustomerController {

  
    ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    CustomerDAO customerDAO = context.getBean("customerDAO", CustomerDAO.class);
    PackageDAO packageDAO = context.getBean("packageDAO", PackageDAO.class);
    BookingDAO bookingDAO = context.getBean("bookingDAO", BookingDAO.class);

    // === 1. Show Customer Registration Form ===
    @RequestMapping(value = "/customerRegister", method = RequestMethod.GET)
    public String showCustomerRegisterForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "customerRegister";
    }

    // === 2. Save Customer Registration ===
    @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
    public String saveCustomer(@ModelAttribute Customer customer) {
        customerDAO.addCustomer(customer); // Instance method
        return "customerLogin"; // After registration, go to login page
    }

    // === 3. Login Customer ===

    //  Handle login
    @RequestMapping(value = "/submitCustomerLogin", method = RequestMethod.POST)
    public String submitCustomerLogin(HttpServletRequest request, Model model) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer customer = customerDAO.getCustomerByEmail(email);
        if (customer != null && customer.getPassword().equals(password)) {
            request.getSession().setAttribute("customerId", customer.getCustomer_id());
            System.out.println("customer ID: " + customer.getCustomer_id());

            return "redirect:/customerDashboard";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "customerLogin";
        }
    }

    // === 4. Customer Dashboard ===
    @RequestMapping("/customerDashboard")
    public String customerDashboard(HttpServletRequest request, Model model) {
        Object cidObj = request.getSession().getAttribute("customerId");
        if (cidObj == null) {
            return "redirect:/customerLogin"; // Not logged in
        }
        int customerId = (int) cidObj;
        model.addAttribute("cid", customerId);

        List<TravelPackage> packages = packageDAO.getAllPackages();
        model.addAttribute("packages", packages);

        List<Booking> myBookings = bookingDAO.getBookingsByCustomerId(customerId);
        model.addAttribute("myBookings", myBookings);

        return "customerDashboard";
    }

    // === 5. Book a Package ===
    @RequestMapping("/bookPackage")
    public String bookPackage(HttpServletRequest request) {
        int packageId = Integer.parseInt(request.getParameter("id"));
        int customerId = (int) request.getSession().getAttribute("customerId");
        
        Customer customer = customerDAO.getCustomerById(customerId);
        TravelPackage travelPackage = packageDAO.getPackageById(packageId);

        if (customer != null && travelPackage != null) {
            Booking booking = new Booking();
            booking.setCustomer_id(customerId);
            booking.setCustomer_name(customer.getCustomer_name());
            booking.setPackage_id(packageId);
            booking.setPackage_name(travelPackage.getPackage_name());
            booking.setGuide_id(travelPackage.getGuide_id());
            booking.setGuide_name(travelPackage.getGuide_name());
            booking.setStatus("Pending");
            booking.setBooking_date(new Date(System.currentTimeMillis()));

            bookingDAO.addBooking(booking);
        }

        return "redirect:/myBookings";
    }
    
  //=== 6. View My Bookings ===
    @RequestMapping("/myBookings")
    public String viewMyBookings(HttpServletRequest request, Model model) {
        Object custObj = request.getSession().getAttribute("customerId");
        int customerId = 0;

        if (custObj != null) {
            customerId = Integer.parseInt(custObj.toString());
        }

        List<Booking> bookings = bookingDAO.getBookingsByCustomerId(customerId);
        model.addAttribute("myBookings", bookings);
        model.addAttribute("bookings", bookings);
        model.addAttribute("customerId", customerId); // so JSP gets it
        return "myBookings";
    }
    
    

    @RequestMapping("/viewMyBookings")
    public ModelAndView viewMyBookings(int customer_id) {
        List<Booking> list = bookingDAO.viewMyBookings(customer_id);
        ModelAndView mv = new ModelAndView("viewMyBookings");
        mv.addObject("bookings", list);
        return mv;
    }

}
