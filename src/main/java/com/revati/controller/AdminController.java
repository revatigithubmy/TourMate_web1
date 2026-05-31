package com.revati.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.revati.dao.BookingDAO;
import com.revati.dao.CustomerDAO;
import com.revati.dao.GuideDAO;
import com.revati.dao.PackageDAO;
import com.revati.model.Booking;
import com.revati.model.Customer;
import com.revati.model.Guide;
import com.revati.model.TravelPackage;


@Controller
public class AdminController {
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");

    GuideDAO guideDAO = context.getBean("guideDAO", GuideDAO.class);
    CustomerDAO customerDAO = context.getBean("customerDAO", CustomerDAO.class);
    PackageDAO packageDAO = context.getBean("packageDAO", PackageDAO.class);
    BookingDAO bookingDAO = context.getBean("bookingDAO", BookingDAO.class);
	

    @RequestMapping(value = "/submitAdminLogin", method = RequestMethod.POST)
    public String submitAdminLogin(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
            return "redirect:/adminDashboard";
        } else {
            return "adminLogin";
        }
    }

    //  Admin Dashboard → show all Guides
    @RequestMapping("/adminDashboard")
    public String openAdminDashboard(Model model) {
        List<Guide> allGuides = guideDAO.getAllGuides();
        model.addAttribute("allGuides", allGuides);
        return "adminDashboard";
    }
    
    
    @RequestMapping("/viewAllPackages")
    public String viewAllPackages(Model model) {
        List<TravelPackage> packages = packageDAO.getAllPackages();

        System.out.println("Fetched packages: " + packages.size());
        for (TravelPackage p : packages) {
            System.out.println(p.getPackage_name());  // Debug log
        }

        model.addAttribute("packages", packages);
        return "viewAllPackages";
    }

    

    //  Add Package Form
    @RequestMapping("/addPackageForm")
    public String showAddPackageForm(Model model) {
        model.addAttribute("travelPackage", new TravelPackage());
        return "addPackageForm";
    }

    @RequestMapping(value = "/addPackage", method = RequestMethod.POST)
    public String addPackage(@ModelAttribute("travelPackage") TravelPackage travelPackage) {
        packageDAO.addPackage(travelPackage);
        return "redirect:/viewAllPackages";
    }
    
    //  Save Package
    @RequestMapping(value = "/savePackage", method = RequestMethod.POST)
    public String savePackage(@ModelAttribute TravelPackage travelPackage) {
        packageDAO.addPackage(travelPackage);
        return "redirect:/viewAllPackages";
    }
    
    
    // Handle Package Submission
    @PostMapping("/submitPackage")
    public String submitPackage(HttpServletRequest request) {
        String packageName = request.getParameter("package_name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int guideId = Integer.parseInt(request.getParameter("guide_id"));
        String guideName = request.getParameter("guide_name");
        int duration = Integer.parseInt(request.getParameter("duration"));

        TravelPackage travelPackage = new TravelPackage();
        travelPackage.setPackage_name(packageName);
        travelPackage.setLocation(location);
        travelPackage.setDescription(description);
        travelPackage.setPrice(price);
        travelPackage.setGuide_id(guideId);
        travelPackage.setGuide_name(guideName);
        travelPackage.setDuration(duration);

        packageDAO.addPackage(travelPackage);

        return "redirect:/viewAllPackages"; // or any success page
    }
    
    
    // Delete Package
    @RequestMapping("/deletePackage")
    public String deletePackage(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        packageDAO.deletePackage(id);
        return "redirect:/viewAllPackages";
    }
//    
 //  View Customers
    @RequestMapping("/viewAllCustomers")
    public String viewCustomers(Model model) {
        List<Customer> customers = customerDAO.getAllCustomer();
        model.addAttribute("customers", customers);
        return "viewAllCustomers";
    }
    
 //  View Bookings
    @RequestMapping("/viewBookings")
    public String viewBookings(Model model) {
        List<Booking> bookings = bookingDAO.getAllBookings();
        model.addAttribute("bookings", bookings);
        return "viewBookings";
    }
    
    //Approve Booking
    @RequestMapping("/approveBooking")
    public String approveBooking(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        Booking booking = bookingDAO.getBookingById(id);
        if (booking != null) {
            booking.setStatus("Approved");
            bookingDAO.updateBooking(booking);
        }
        return "redirect:/viewBookings";
    }
    
    // Reject Booking
    @RequestMapping("/rejectBooking")
    public String rejectBooking(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        Booking booking = bookingDAO.getBookingById(id);
        if (booking != null) {
            booking.setStatus("Rejected");
            bookingDAO.updateBooking(booking);
        }
        return "redirect:/viewBookings";
    }
    
    //  Add Guide Form
    @RequestMapping(value = "/addGuide", method = RequestMethod.GET)
    public String showAddGuideForm(Model model) {
        model.addAttribute("guide", new Guide());
        return "addGuide";
    }

   
 //  Delete Guide
    @RequestMapping("/deleteGuide")
    public String deleteGuide(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        guideDAO.deleteGuide(id);
        return "redirect:/adminDashboard";
    }
    
    
    @RequestMapping("/viewAllGuides")
    public String viewAllGuides(Model model) {
        List<Guide> guides = guideDAO.getAllGuides(); // your DAO logic
        model.addAttribute("guides", guides);
        return "viewAllGuides"; // viewAllGuides.jsp
    }
    
    
    //View All Bookings
    @RequestMapping("/viewAllBookings")
    public String viewAllBookings(Model model) {
        List<Booking> bookings = bookingDAO.getAllBookings();
        model.addAttribute("bookings", bookings);
        return "viewAllBookings";
    }

}
