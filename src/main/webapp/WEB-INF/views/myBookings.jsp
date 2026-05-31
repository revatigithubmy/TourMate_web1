<%@ page import="java.util.List" %>
<%@ page import="com.revati.model.Booking" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Bookings</title>
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
            font-family: 'Poppins', sans-serif;
            color: var(--text);
            line-height: 1.6;
            background-color: var(--light);
            padding: 20px;
            margin-top: 80px;
        }
        
        h2 {
            color: var(--dark);
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: var(--primary);
            color: var(--white);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        tr:nth-child(even) {
            background-color: rgba(0, 128, 128, 0.05);
        }
        
        tr:hover {
            background-color: rgba(0, 128, 128, 0.1);
        }
        
        td {
            color: var(--text);
        }
        
        /* Status styling */
        td:last-child {
            font-weight: 500;
        }
        
        /* Responsive table */
        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }
        }
        
        /* Header styling */
        header {
            background: var(--primary);
            color: var(--white);
            padding: 15px 0;
            text-align: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }
        
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Add some accent colors for visual interest */
        .accent-text {
            color: var(--accent);
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <h1>My <span class="accent-text">Bookings</span></h1>
        </div>
    </header>

    <main>
        
        <table>
            <tr>
                <th>Package Id</th>
                <th>Package Name</th>
                <th>Guide ID</th>
                <th>Guide Name</th>
                <th>Booking Date</th>
                <th>Status</th>
            </tr>
            <%
                List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                if (bookings != null) {
                    for (Booking b : bookings) {
            %>
            <tr>
                <td><%= b.getPackage_id() %></td>
                <td><%= b.getPackage_name() %></td>
                <td><%= b.getGuide_id() %></td>
                <td><%= b.getGuide_name() %></td>
                <td><%= b.getBooking_date() %></td>
                <td><%= b.getStatus() %></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </main>
</body>
</html>