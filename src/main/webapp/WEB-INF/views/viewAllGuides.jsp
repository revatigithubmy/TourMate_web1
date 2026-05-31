<%@ page import="java.util.List" %>
<%@ page import="com.revati.model.Guide" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Tour Guides</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                    url('https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-attachment: fixed;
        background-position: center;
        color: #333;
        min-height: 100vh;
    }

    .container {
        width: 90%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    h2 {
        text-align: center;
        margin: 40px 0 30px;
        color: #fff;
        font-size: 2.5rem;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        position: relative;
        padding-bottom: 15px;
    }

    h2::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 100px;
        height: 3px;
        background: #4CAF50;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 30px auto;
        background: rgba(255, 255, 255, 0.95);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        overflow: hidden;
    }

    table th {
        background: #008080;
        color: white;
        padding: 16px;
        text-align: center;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        font-size: 0.9rem;
        position: sticky;
        top: 0;
    }

    table td {
        padding: 14px;
        border-bottom: 1px solid #e0e0e0;
        text-align: center;
        transition: all 0.3s ease;
    }

    table tr:not(:first-child):hover td {
        background: rgba(0, 128, 128, 0.08);
        transform: translateY(-1px);
    }

    .no-guides {
        text-align: center;
        padding: 25px;
        color: #666;
        font-style: italic;
        font-size: 1.1rem;
    }

    /* Animation for table rows */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    table tbody tr {
        animation: fadeIn 0.4s ease forwards;
    }

    table tbody tr:nth-child(1) { animation-delay: 0.1s; }
    table tbody tr:nth-child(2) { animation-delay: 0.2s; }
    table tbody tr:nth-child(3) { animation-delay: 0.3s; }
    /* Continue pattern for more rows */


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


    /* Responsive design */
    @media (max-width: 768px) {
        .container {
            width: 95%;
            padding: 10px;
        }
        
        h2 {
            font-size: 2rem;
            margin: 30px 0 20px;
        }
        
        table {
            display: block;
            overflow-x: auto;
            white-space: nowrap;
        }
        
        table th, table td {
            padding: 10px 8px;
            font-size: 0.85rem;
        }
    }

    @media (max-width: 480px) {
        h2 {
            font-size: 1.8rem;
        }
        
        table th {
            font-size: 0.8rem;
            padding: 8px 6px;
        }
        
        table td {
            padding: 8px 6px;
            font-size: 0.8rem;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h2>All Tour Guides</h2>
        
        <table>
            <thead>
                <tr>
                    <th>Guide ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Language</th>
                    <th>Experience</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Guide> guides = (List<Guide>) request.getAttribute("guides");
                if (guides != null && !guides.isEmpty()) {
                    for (Guide guide : guides) {
            %>
                <tr>
                    <td><%= guide.getGuide_id() %></td>
                    <td><%= guide.getGuide_name() %></td>
                    <td><%= guide.getEmail() %></td>
                    <td><%= guide.getPhone() %></td>
                    <td><%= guide.getLanguage() %></td>
                    <td><%= guide.getExperience() %></td>
                    <td>
                        <a href="deletePackage?id=<%= guide.getGuide_id() %>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this Guide?');">Delete</a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6" class="no-guides">No guides found in our system.</td>
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