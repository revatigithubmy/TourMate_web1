<%@ page import="java.util.List" %>
<%@ page import="com.revati.model.TravelPackage" %>
<%@ page import="com.revati.model.Booking" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard | TourMate</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #008080;       /* Teal */
            --secondary: #006666;     /* Darker Teal */
            --accent: #FFA500;        /* Orange */
            --light: #E6F2F2;         /* Light Teal */
            --dark: #003333;          /* Very Dark Teal */
            --text: #333333;          /* Dark Gray */
            --white: #ffffff;         /* White */
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light);
            color: var(--text);
            line-height: 1.6;
            padding: 20px;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 30px;
            background: var(--white);
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: var(--primary);
            margin-bottom: 25px;
            font-size: 2.2rem;
            text-align: center;
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
            height: 4px;
            background: var(--accent);
        }

        h3 {
            color: var(--primary);
            margin: 30px 0 20px;
            font-size: 1.6rem;
            display: flex;
            align-items: center;
        }

        h3 i {
            margin-right: 12px;
            color: var(--accent);
        }

        .welcome-message {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: var(--white);
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .welcome-message p {
            font-size: 1.2rem;
        }

        .tour-categories {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin: 25px 0;
            justify-content: center;
        }

        .category-tag {
            padding: 8px 20px;
            border-radius: 20px;
            font-size: 0.95rem;
            font-weight: 500;
            color: var(--white);
        }

        .adventure {
            background-color: var(--primary);
        }

        .cultural {
            background-color: var(--secondary);
        }

        .beach {
            background-color: var(--accent);
        }

        .honeymoon {
            background-color: #A593E0; /* Purple from your scheme */
        }

        .family {
            background-color: #FF9A76; /* Coral from your scheme */
        }

        .packages-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin: 25px 0;
        }

        .package-card {
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 20px;
            background: var(--white);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .package-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border-color: var(--primary);
        }

        .package-card h4 {
            font-size: 1.3rem;
            color: var(--primary);
            margin-bottom: 12px;
        }

        .package-card p {
            margin: 10px 0;
            font-size: 0.95rem;
            color: var(--text);
        }

        .package-card .price {
            font-size: 1.4rem;
            font-weight: 600;
            color: var(--dark);
            margin: 15px 0;
        }

        .package-card .price::before {
            content: '₹';
            font-family: inherit;
        }

        .book-btn {
            background: var(--accent);
            color: var(--white);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-family: inherit;
            font-weight: 500;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .book-btn:hover {
            background: #e69500; /* Slightly darker orange */
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 165, 0, 0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            background: var(--white);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background: var(--primary);
            color: var(--white);
            padding: 15px;
            text-align: left;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 1px;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
        }

        tr:hover {
            background: rgba(0, 128, 128, 0.05);
        }

        .status-confirmed {
            color: #4bb543; /* Green */
            font-weight: 500;
        }

        .status-pending {
            color: var(--accent); /* Orange */
            font-weight: 500;
        }

        .status-cancelled {
            color: #e63946; /* Red */
            font-weight: 500;
        }

        .no-data {
            text-align: center;
            padding: 30px;
            color: #666;
            font-style: italic;
            background: rgba(0, 0, 0, 0.03);
            border-radius: 8px;
            margin: 25px 0;
        }

        .no-data i {
            font-size: 2rem;
            margin-bottom: 15px;
            color: var(--primary);
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-top: 25px;
            padding: 10px 25px;
            background: var(--primary);
            color: var(--white);
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .back-btn:hover {
            background: var(--secondary);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        hr {
            border: none;
            height: 1px;
            background: #e0e0e0;
            margin: 30px 0;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .package-card {
            animation: fadeIn 0.5s ease forwards;
        }

        tr {
            animation: fadeIn 0.5s ease forwards;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .packages-container {
                grid-template-columns: 1fr;
            }
            
            .dashboard-container {
                padding: 20px;
            }
        
            h2 {
                font-size: 1.8rem;
            }
            
            h3 {
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2><i class="fas fa-user-circle"></i> Customer Dashboard</h2>
        
        <div class="welcome-message">
            <p>Welcome back! Explore our amazing travel packages and manage your bookings.</p>
        </div>

        <div class="tour-categories">
            <span class="category-tag adventure"><i class="fas fa-hiking"></i> Adventure</span>
            <span class="category-tag cultural"><i class="fas fa-landmark"></i> Cultural</span>
            <span class="category-tag beach"><i class="fas fa-umbrella-beach"></i> Beach</span>
            <span class="category-tag honeymoon"><i class="fas fa-heart"></i> Honeymoon</span>
            <span class="category-tag family"><i class="fas fa-users"></i> Family</span>
        </div>

        <h3><i class="fas fa-suitcase"></i> Available Packages</h3>
        <%
            List<TravelPackage> packages = (List<TravelPackage>) request.getAttribute("packages");
            int customerId = (Integer) request.getAttribute("cid");

            if (packages != null && !packages.isEmpty()) {
        %>
                <div class="packages-container">
                    <%
                        for (TravelPackage tp : packages) {
                    %>
                            <div class="package-card">
                                <h4><%= tp.getPackage_name() %></h4>
                                <p><i class="fas fa-map-marker-alt"></i> <strong>Location:</strong> <%= tp.getLocation() %></p>
                                  <p><i class="fas fa-map-marker-alt"></i> <strong>Description:</strong> <%= tp.getDescription() %></p>
                                <p><i class="fas fa-calendar-alt"></i> <strong>Duration:</strong> <%= tp.getDuration() %> days</p>
                                <p><i class="fas fa-tag"></i> &#x20B9;<%= tp.getPrice() %></p>
                                
                                <form action="bookPackage" method="get">
                                    <input type="hidden" name="id" value="<%= tp.getPackage_id() %>">
                                    <input type="hidden" name="cid" value="<%= customerId %>">
                                    <button type="submit" class="book-btn">
                                        <i class="fas fa-bookmark"></i> Book Now
                                    </button>
                                </form>
                            </div>
                    <%
                        }
                    %>
                </div>
        <%
            } else {
        %>
            <div class="no-data">
                <i class="fas fa-info-circle"></i>
                <p>No travel packages available at the moment.</p>
                <p>Please check back later or contact our support team.</p>
            </div>
        <%
            }
        %>

        <hr>

        <h3><i class="fas fa-calendar-check"></i> My Bookings</h3>
        <%
            List<Booking> myBookings = (List<Booking>) request.getAttribute("myBookings");
            if (myBookings != null && !myBookings.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>Package ID</th>
                    <th>Package Name</th>
                    <th>Guide ID</th>
                    <th>Guide Name</th>
                    <th>Booking Date</th>
                    <th>Status</th>
                </tr>
                <%
                    for (Booking b : myBookings) {
                        String statusClass = "";
                        if ("Confirmed".equalsIgnoreCase(b.getStatus())) {
                            statusClass = "status-confirmed";
                        } else if ("Pending".equalsIgnoreCase(b.getStatus())) {
                            statusClass = "status-pending";
                        } else if ("Cancelled".equalsIgnoreCase(b.getStatus())) {
                            statusClass = "status-cancelled";
                        }
                %>
                    <tr>
                        <td><%= b.getPackage_id() %></td>
                        <td><%= b.getPackage_name() %></td>
                        <td><%= b.getGuide_id() %></td>
                        <td><%= b.getGuide_name() %></td>
                        <td><%= b.getBooking_date() %></td>
                        <td class="<%= statusClass %>"><%= b.getStatus() %></td>
                    </tr>
                <%
                    }
                %>
            </table>
        <%
            } else {
        %>
            <div class="no-data">
                <i class="fas fa-calendar-plus"></i>
                <p>You haven't made any bookings yet.</p>
                <p>Explore our packages above to start your journey!</p>
            </div>
        <%
            }
        %>
        
        <a href="index" class="back-btn"><i class="fas fa-home"></i> Back to Home</a>
    </div>

    <script>
        // Simple animation trigger
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.package-card');
            cards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.1}s`;
            });
            
            const rows = document.querySelectorAll('tr');
            rows.forEach((row, index) => {
                row.style.animationDelay = `${index * 0.1}s`;
            });
        });
    </script>
</body>
</html>