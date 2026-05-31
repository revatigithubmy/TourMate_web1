<%@ page import="java.util.List" %>
<%@ page import="com.revati.model.Customer" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Customers</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('https://images.unsplash.com/photo-1551524559-8af4e6624178?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            color: #333;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            margin: 30px 0;
            color: #fff;
            font-size: 2.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            padding: 20px 0;
            position: relative;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: #4CAF50;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            overflow: hidden;
        }

        table th {
            background: #008080;
            color: white;
            padding: 15px;
            text-align: center;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: sticky;
            top: 0;
        }

        table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
            text-align: center;
            transition: all 0.3s ease;
        }

        table tr:not(:first-child):hover td {
            background: rgba(0, 128, 128, 0.1);
            transform: translateY(-1px);
        }

        .no-customers {
            text-align: center;
            padding: 30px;
            color: #fff;
            font-size: 1.3rem;
            background: rgba(0, 0, 0, 0.6);
            width: 60%;
            margin: 50px auto;
            border-radius: 8px;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        /* Animation for table rows */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        table tbody tr {
            animation: fadeIn 0.5s ease forwards;
        }

        table tbody tr:nth-child(1) { animation-delay: 0.1s; }
        table tbody tr:nth-child(2) { animation-delay: 0.2s; }
        table tbody tr:nth-child(3) { animation-delay: 0.3s; }
        table tbody tr:nth-child(4) { animation-delay: 0.4s; }
        table tbody tr:nth-child(5) { animation-delay: 0.5s; }


        /* Back button */
        .back-btn {
            display: inline-block;
            margin: 20px;
            padding: 10px 20px;
            background-color: #008080;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }

        .back-btn:hover {
            background-color: #006666;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }
            
            h2 {
                font-size: 2rem;
            }
            
            .no-customers {
                width: 80%;
                padding: 20px;
                font-size: 1.1rem;
            }
            
            .container {
                width: 95%;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>All Customers</h2>
   
    
    <%
        List<Customer> customers = (List<Customer>) request.getAttribute("customers");
        if (customers != null && !customers.isEmpty()) {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
            </tr>
    <%
            for (Customer c : customers) {
    %>
            <tr>
                <td><%= c.getCustomer_id() %></td>
                <td><%= c.getCustomer_name() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getPhone() %></td>
            </tr>
    <%
            }
    %>
        </table>
    <%
        } else {
    %>
        <p class="no-customers">No customers found in the database.</p>
    <%
        }
    %>
    
     <a href="adminDashboard" class="back-btn"> Back to Dashboard</a>
</div>
</body>
</html>