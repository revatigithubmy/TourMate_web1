<%@ page import="com.revati.model.Booking" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    Booking booking = (Booking) request.getAttribute("booking");
    if (booking == null) {
        response.sendRedirect("guideDashboard");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Booking</title>
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
            padding: 20px;
        }
        
        .update-container {
            max-width: 600px;
            margin: 50px auto;
            background: var(--white);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            color: var(--primary);
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--light);
            font-size: 1.8rem;
        }
        
        .booking-info {
            margin-bottom: 25px;
        }
        
        .booking-info p {
            margin-bottom: 10px;
            font-size: 1.1rem;
        }
        
        .booking-info strong {
            color: var(--dark);
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
        }
        
        select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: var(--white);
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        select:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(0, 128, 128, 0.2);
        }
        
        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 25px;
            border-radius: 5px;
            font-weight: 500;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-size: 1rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-primary {
            background-color: var(--primary);
            color: var(--white);
        }
        
        .btn-primary:hover {
            background-color: var(--secondary);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 128, 128, 0.3);
        }
        
        .btn-secondary {
            background-color: var(--light);
            color: var(--dark);
            border: 1px solid #ddd;
        }
        
        .btn-secondary:hover {
            background-color: #d9e9e9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
            margin-left: 5px;
        }
        
        .status-pending {
            background-color: rgba(255, 165, 0, 0.1);
            color: var(--accent);
        }
        
        .status-in-progress {
            background-color: rgba(0, 128, 128, 0.1);
            color: var(--primary);
        }
        
        .status-completed {
            background-color: rgba(0, 200, 0, 0.1);
            color: #008000;
        }
        
        @media (max-width: 768px) {
            .update-container {
                margin: 20px auto;
                padding: 20px;
            }
            
            h2 {
                font-size: 1.5rem;
            }
            
            .button-group {
                flex-direction: column;
                gap: 10px;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="update-container">
        <h2>
            <i class="fas fa-edit"></i> Update Booking #<%= booking.getBooking_id() %>
        </h2>
        
        <div class="booking-info">
            <p><strong>Package:</strong> <%= booking.getPackage_name() %></p>
            <p>
                <strong>Current Status:</strong> 
                <span class="status-badge status-<%= booking.getStatus().toLowerCase().replace("-", "") %>">
                    <%= booking.getStatus() %>
                </span>
            </p>
        </div>
        
        <form action="submitUpdateBooking" method="post">
            <input type="hidden" name="bookingId" value="<%= booking.getBooking_id() %>" />
            
            <div class="form-group">
                <label for="status">New Status:</label>
                <select name="status" id="status" required>
                    <option value="Pending" <%= "Pending".equals(booking.getStatus()) ? "selected" : "" %>>Pending</option>
                    <option value="In-progress" <%= "In-progress".equals(booking.getStatus()) ? "selected" : "" %>>In-progress</option>
                    <option value="Completed" <%= "Completed".equals(booking.getStatus()) ? "selected" : "" %>>Completed</option>
                </select>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Update Status
                </button>
                <a href="guideDashboard" class="btn btn-secondary">
                    <i class="fas fa-times"></i> Cancel
                </a>
            </div>
        </form>
    </div>
</body>
</html>