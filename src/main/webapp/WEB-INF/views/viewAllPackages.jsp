<%@ page import="java.util.List" %>
<%@ page import="com.revati.model.TravelPackage" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Travel Packages</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                    url('https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
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
        margin: 0 auto;
        padding: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 30px auto;
        background: rgba(255, 255, 255, 0.9);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
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

    .btn-delete {
        background-color: #e74c3c;
        color: white;
        padding: 8px 15px;
        border: none;
        border-radius: 4px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
        display: inline-block;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .btn-delete:hover {
        background-color: #c0392b;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .no-packages {
        text-align: center;
        padding: 20px;
        color: #666;
        font-style: italic;
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
    /* Continue for more rows if needed */

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
    }
</style>
</head>
<body>
    <div class="container">
        <h2>All Travel Packages</h2>

        <table>
            <thead>
                <tr>
                    <th>Package ID</th>
                    <th>Name</th>
                    <th>Location</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Guide ID</th>
                    <th>Guide Name</th>
                    <th>Duration (Days)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<TravelPackage> packages = (List<TravelPackage>) request.getAttribute("packages");
                    if (packages != null && !packages.isEmpty()) {
                        for (TravelPackage pkg : packages) {
                %>
                <tr>
                    <td><%= pkg.getPackage_id() %></td>
                    <td><%= pkg.getPackage_name() %></td>
                    <td><%= pkg.getLocation() %></td>
                    <td><%= pkg.getDescription() %></td>
                    <td><%= pkg.getPrice() %></td>
                    <td><%= pkg.getGuide_id() %></td>
                    <td><%= pkg.getGuide_name() %></td>
                    <td><%= pkg.getDuration() %></td>
                    <td>
                        <a href="deletePackage?id=<%= pkg.getPackage_id() %>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this package?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="9" class="no-packages">No packages available.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
         <a href="adminDashboard" class="back-btn"> Back to Dashboard</a>
    </div>
</body>
</html>