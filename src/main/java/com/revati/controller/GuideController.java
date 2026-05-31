package com.revati.controller;

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
import com.revati.dao.GuideDAO;
import com.revati.dao.PackageDAO;
import com.revati.model.Booking;
import com.revati.model.Customer;
import com.revati.model.Guide;


import org.springframework.transaction.annotation.Transactional;
@Controller
public class GuideController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	 PackageDAO packageDAO = context.getBean("packageDAO", PackageDAO.class);
	GuideDAO guideDAO = context.getBean("guideDAO", GuideDAO.class);
	BookingDAO bookingDAO = context.getBean("bookingDAO", BookingDAO.class);

	// GET: Show registration form
	@RequestMapping(value = "/guideRegister", method = RequestMethod.GET)
	public String showGuideRegisterForm(Model model) {
		model.addAttribute("guide", new Guide());
		return "guideRegister";
	}

	// POST: Save guide registration
	@RequestMapping(value = "/saveGuide", method = RequestMethod.POST)
	public String saveGuide(@ModelAttribute Guide guide) {
		guideDAO.addGuide(guide);
		return "guideLogin"; // after registration go to login page
										 
	}

	 //  Handle login
    @RequestMapping(value = "/submitGuideLogin", method = RequestMethod.POST)
    public String submitGuideLogin(HttpServletRequest request, Model model) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Guide guide = guideDAO.getGuideByEmail(email);
        if (guide != null && guide.getPassword().equals(password)) {
            request.getSession().setAttribute("guideId", guide.getGuide_id());
            System.out.println("Guide ID: " + guide.getGuide_id());

            return "redirect:/guideDashboard";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "guideLogin";
        }
    }

    
    // 1) Guide dashboard (lists bookings assigned to this guide)
    @RequestMapping("/guideDashboard")
    public String guideDashboard(HttpServletRequest request, Model model) {
        Integer guideId = (Integer) request.getSession().getAttribute("guideId");
        if (guideId == null) {
            return "redirect:/guideLogin"; // not logged in
        }

        List<Booking> bookings = bookingDAO.getBookingsByGuideId(guideId);
        model.addAttribute("bookings", bookings);
        model.addAttribute("guideId", guideId);
        return "guideDashboard"; // resolves to guideDashboard.jsp
    }

    // 2) Open single booking update form
    @RequestMapping(value = "/updateBookingForm", method = RequestMethod.GET)
    public String updateBookingForm(HttpServletRequest request, Model model) {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        Booking booking = bookingDAO.getBookingById(bookingId);
        model.addAttribute("booking", booking);
        Integer guideId = (Integer) request.getSession().getAttribute("guideId");
        model.addAttribute("guideId", guideId);
        return "updateBooking"; // updateBooking.jsp
    }

    // 3) Submit updated status (POST)
    @RequestMapping(value = "/submitUpdateBooking", method = RequestMethod.POST)
    public String submitUpdateBooking(HttpServletRequest request) {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String status = request.getParameter("status");

        Booking booking = bookingDAO.getBookingById(bookingId);
        if (booking != null) {
            booking.setStatus(status);
            bookingDAO.updateBooking(booking); // DAO method is transactional and write-enabled
        }

        return "redirect:/guideDashboard"; // back to dashboard
    }
    
}
