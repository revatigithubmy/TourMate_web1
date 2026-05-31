<%@ page import="java.util.List" %>
<%@ page import="com.revati.model.Booking" %>
<%@ page import="com.revati.model.Guide" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    Integer guideId = (Integer) session.getAttribute("guideId");
    if (guideId == null) {
        response.sendRedirect("guideLogin");
        return;
    }
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Guide Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #008080;
            --secondary: #006666;
            --accent: #FFA500;
            --light: #E6F2F2;
            --dark: #003333;
            --text: #333333;
            --white: #ffffff;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: var(--light);
            color: var(--text);
            line-height: 1.6;
        }
        
        header {
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 5%;
            backdrop-filter: blur(10px);
            transform-style: preserve-3d;
            transition: all 0.5s ease;
        }
        
        header.scrolled {
            padding: 10px 5%;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        }
        
        .logo {
            font-size: 28px;
            font-weight: 700;
            color: var(--primary);
            letter-spacing: 1px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            transform: translateZ(20px);
        }
        
        .logo:hover {
            transform: translateZ(20px) scale(1.05);
            text-shadow: 0 5px 15px rgba(0, 128, 128, 0.3);
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary);
            color: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
        
        .container {
            max-width: 1200px;
            margin: 100px auto 40px;
            padding: 0 20px;
        }
        
        .dashboard-header {
            background: var(--white);
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .dashboard-title h1 {
            color: var(--dark);
            font-size: 2rem;
            margin-bottom: 5px;
        }
        
        .dashboard-title p {
            color: var(--text);
            opacity: 0.8;
        }
        
        .logout-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            background-color: var(--accent);
            color: var(--white);
            text-decoration: none;
            border-radius: 30px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 165, 0, 0.3);
        }
        
        .logout-btn:hover {
            background-color: #e69500;
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255, 165, 0, 0.4);
        }
        
        .message-container {
            margin-bottom: 30px;
        }
        
        .alert {
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        
        .alert-success {
            background-color: rgba(0, 128, 128, 0.1);
            border-left: 4px solid var(--primary);
            color: var(--primary);
        }
        
        .alert-error {
            background-color: rgba(255, 0, 0, 0.1);
            border-left: 4px solid #ff0000;
            color: #ff0000;
        }
        
        .alert i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
        
        .bookings-table {
            width: 100%;
            border-collapse: collapse;
            margin: 30px 0;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
            border-radius: 10px;
            overflow: hidden;
        }
        
        .bookings-table th, 
        .bookings-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .bookings-table th {
            background-color: var(--primary);
            color: var(--white);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }
        
        .bookings-table tr:nth-child(even) {
            background-color: rgba(0, 128, 128, 0.03);
        }
        
        .bookings-table tr:hover {
            background-color: rgba(0, 128, 128, 0.08);
        }
        
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
        }
        
        .status-pending {
            background-color: rgba(255, 165, 0, 0.1);
            color: var(--accent);
        }
        
        .status-confirmed {
            background-color: rgba(0, 128, 128, 0.1);
            color: var(--primary);
        }
        
        .status-cancelled {
            background-color: rgba(255, 0, 0, 0.1);
            color: #ff0000;
        }
        
        .action-btn {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 8px 15px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }
        
        .edit-btn {
            background-color: var(--primary);
            color: var(--white);
        }
        
        .edit-btn:hover {
            background-color: var(--secondary);
            transform: translateY(-2px);
        }
        
        .no-bookings {
            text-align: center;
            padding: 50px;
            background-color: var(--white);
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .no-bookings i {
            font-size: 3rem;
            color: var(--primary);
            margin-bottom: 20px;
            opacity: 0.5;
        }
        
        .no-bookings h3 {
            color: var(--dark);
            margin-bottom: 10px;
        }
        
        .no-bookings p {
            color: var(--text);
            opacity: 0.7;
            margin-bottom: 20px;
        }
        
        .refresh-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            background-color: var(--primary);
            color: var(--white);
            text-decoration: none;
            border-radius: 30px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .refresh-btn:hover {
            background-color: var(--secondary);
            transform: translateY(-3px);
        }
        
        @media (max-width: 768px) {
            .container {
                margin-top: 80px;
            }
            
            .dashboard-header {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }
            
            .bookings-table {
                display: block;
                overflow-x: auto;
            }
            
            .bookings-table th, 
            .bookings-table td {
                padding: 10px 5px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">TourMate</div>
        <div class="user-info">
            <div class="avatar">G</div>
            <span>Guide Dashboard</span>
        </div>
    </header>
    
    <div class="container">
        <div class="dashboard-header">
            <div class="dashboard-title">
                <h1>Your Booking Assignments</h1>
                <p>Manage all your assigned tour bookings</p>
            </div>
            <a href="index" class="logout-btn">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>
        
        <% if (message != null) { %>
        <div class="message-container">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i>
                <%= message %>
            </div>
        </div>
        <% } %>
        
        <% if (error != null) { %>
        <div class="message-container">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>
                <%= error %>
            </div>
        </div>
        <% } %>
        
        <% if (bookings != null && !bookings.isEmpty()) { %>
        <table class="bookings-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Booking Date</th>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Package</th>
                    <th>Package Id</th>
                    <th>Guide Name</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking b : bookings) { %>
                <tr>
                    <td><%= b.getBooking_id() %></td>
                    <td><%= b.getBooking_date() %></td>
                    <td><%= b.getCustomer_id() %></td>
                    <td><%= b.getCustomer_name() %></td>
                    <td><%= b.getPackage_name() %></td>
                    <td><%= b.getPackage_id() %></td>
                    <td><%= b.getGuide_name() %></td>
                    <td>
                        <span class="status-badge status-<%= b.getStatus().toLowerCase() %>">
                            <%= b.getStatus() %>
                        </span>
                    </td>
                    <td>
                        <a href="updateBookingForm?bookingId=<%= b.getBooking_id() %>" class="action-btn edit-btn">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <div class="no-bookings">
            <i class="fas fa-calendar-times"></i>
            <h3>No Bookings Assigned</h3>
            <p>You currently don't have any bookings assigned to you.</p>
            <a href="guideDashboard" class="refresh-btn">
                <i class="fas fa-sync-alt"></i>
                <span>Refresh</span>
            </a>
        </div>
        <% } %>
    </div>
</body>
</html>