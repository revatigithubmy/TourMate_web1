<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard | Travel Management System</title>
<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
:root {
    --primary-color: #4361ee;
    --secondary-color: #3f37c9;
    --accent-color: #4cc9f0;
    --dark-color: #1a1a2e;
    --light-color: #f8f9fa;
    --success-color: #4bb543;
    --warning-color: #fca311;
    --danger-color: #e63946;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    background-color: #f5f7fa;
    color: #333;
    line-height: 1.6;
}

.admin-container {
    display: flex;
    min-height: 100vh;
}

/* Sidebar Styles */
.sidebar {
    width: 280px;
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: white;
    padding: 20px 0;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    position: fixed;
    height: 100%;
    z-index: 100;
    transition: all 0.3s ease;
}

.sidebar-header {
    display: flex;
    align-items: center;
    padding: 0 20px 20px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.sidebar-header img {
    width: 40px;
    margin-right: 10px;
}

.sidebar-header h3 {
    font-size: 1.2rem;
    font-weight: 600;
}

.sidebar-menu {
    padding: 20px 0;
}

.menu-category {
    color: rgba(255, 255, 255, 0.7);
    font-size: 0.8rem;
    text-transform: uppercase;
    padding: 10px 20px;
    letter-spacing: 1px;
}

.menu-link {
    display: flex;
    align-items: center;
    padding: 12px 20px;
    color: white;
    text-decoration: none;
    transition: all 0.3s ease;
    border-left: 3px solid transparent;
}

.menu-link:hover {
    background: rgba(255, 255, 255, 0.1);
    border-left: 3px solid var(--accent-color);
}

.menu-link.active {
    background: rgba(255, 255, 255, 0.1);
    border-left: 3px solid var(--accent-color);
}

.menu-link i {
    margin-right: 12px;
    font-size: 1.1rem;
    width: 20px;
    text-align: center;
}

/* Main Content Styles */
.main-content {
    flex: 1;
    margin-left: 280px;
    padding: 30px;
    transition: all 0.3s ease;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    padding-bottom: 20px;
    border-bottom: 1px solid #e0e0e0;
}

.header h1 {
    font-size: 1.8rem;
    color: var(--dark-color);
}

.user-info {
    display: flex;
    align-items: center;
}

.user-info img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
    object-fit: cover;
}

.notification-bell {
    position: relative;
    margin-right: 20px;
    cursor: pointer;
}

.notification-bell i {
    font-size: 1.2rem;
    color: var(--dark-color);
}

.notification-count {
    position: absolute;
    top: -5px;
    right: -5px;
    background: var(--danger-color);
    color: white;
    border-radius: 50%;
    width: 18px;
    height: 18px;
    font-size: 0.7rem;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Dashboard Cards */
.dashboard-cards {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 20px;
    margin-bottom: 30px;
}

.card {
    background: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.card-icon {
    width: 50px;
    height: 50px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
    color: white;
}

.card-icon.packages {
    background: linear-gradient(45deg, #4361ee, #3a0ca3);
}

.card-icon.bookings {
    background: linear-gradient(45deg, #f72585, #b5179e);
}

.card-icon.customers {
    background: linear-gradient(45deg, #4cc9f0, #4895ef);
}

.card-icon.guides {
    background: linear-gradient(45deg, #f8961e, #f3722c);
}

.card h3 {
    font-size: 1rem;
    color: #666;
    font-weight: 500;
}

.card h2 {
    font-size: 2rem;
    color: var(--dark-color);
    margin: 5px 0;
}

.card p {
    font-size: 0.9rem;
    color: #888;
}

.card-trend {
    display: flex;
    align-items: center;
    font-size: 0.9rem;
}

.trend-up {
    color: var(--success-color);
}

.trend-down {
    color: var(--danger-color);
}

/* Recent Activity */
.recent-activity {
    background: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    margin-bottom: 30px;
}

.section-title {
    font-size: 1.3rem;
    margin-bottom: 20px;
    color: var(--dark-color);
    display: flex;
    align-items: center;
}

.section-title i {
    margin-right: 10px;
    color: var(--primary-color);
}

.activity-item {
    display: flex;
    padding: 15px 0;
    border-bottom: 1px solid #f0f0f0;
}

.activity-item:last-child {
    border-bottom: none;
}

.activity-icon {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: rgba(67, 97, 238, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
    color: var(--primary-color);
}

.activity-content h4 {
    font-size: 0.95rem;
    margin-bottom: 5px;
}

.activity-content p {
    font-size: 0.85rem;
    color: #888;
}

.activity-time {
    font-size: 0.8rem;
    color: #aaa;
    margin-left: auto;
}

/* Quick Actions */
.quick-actions {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 15px;
}

.action-btn {
    background: white;
    border-radius: 8px;
    padding: 15px;
    text-align: center;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
    cursor: pointer;
    border: none;
    font-family: inherit;
}

.action-btn:hover {
    background: var(--primary-color);
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(67, 97, 238, 0.2);
}

.action-btn i {
    font-size: 1.5rem;
    margin-bottom: 10px;
    display: block;
}

/* Animations */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.card {
    animation: fadeIn 0.5s ease forwards;
}

.card:nth-child(1) { animation-delay: 0.1s; }
.card:nth-child(2) { animation-delay: 0.2s; }
.card:nth-child(3) { animation-delay: 0.3s; }
.card:nth-child(4) { animation-delay: 0.4s; }

.activity-item {
    animation: fadeIn 0.5s ease forwards;
}

.activity-item:nth-child(1) { animation-delay: 0.2s; }
.activity-item:nth-child(2) { animation-delay: 0.3s; }
.activity-item:nth-child(3) { animation-delay: 0.4s; }
.activity-item:nth-child(4) { animation-delay: 0.5s; }

/* Responsive Design */
@media (max-width: 992px) {
    .sidebar {
        width: 80px;
        overflow: hidden;
    }
    
    .sidebar-header h3, .menu-category, .menu-link span {
        display: none;
    }
    
    .menu-link {
        justify-content: center;
        padding: 15px 0;
    }
    
    .menu-link i {
        margin-right: 0;
        font-size: 1.3rem;
    }
    
    .main-content {
        margin-left: 80px;
    }
}

@media (max-width: 768px) {
    .dashboard-cards {
        grid-template-columns: 1fr;
    }
    
    .header {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .user-info {
        margin-top: 15px;
    }
}

/* Notification Popup */
.notification-popup {
    position: absolute;
    top: 40px;
    right: 0;
    width: 300px;
    background: white;
    border-radius: 8px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
    z-index: 10;
    display: none;
    animation: fadeIn 0.3s ease;
}

.notification-popup.show {
    display: block;
}

.notification-header {
    padding: 15px;
    border-bottom: 1px solid #f0f0f0;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.notification-header h4 {
    font-size: 1rem;
}

.notification-header a {
    font-size: 0.8rem;
    color: var(--primary-color);
    text-decoration: none;
}

.notification-item {
    padding: 12px 15px;
    border-bottom: 1px solid #f0f0f0;
    font-size: 0.9rem;
}

.notification-item.unread {
    background: rgba(67, 97, 238, 0.05);
}

.notification-item:last-child {
    border-bottom: none;
}

.notification-footer {
    padding: 10px;
    text-align: center;
    border-top: 1px solid #f0f0f0;
}

.notification-footer a {
    color: var(--primary-color);
    font-size: 0.8rem;
    text-decoration: none;
}
</style>
</head>
<body>
<div class="admin-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <img src="https://cdn-icons-png.flaticon.com/512/2200/2200326.png" alt="Travel Logo">
            <h3>TourMate Admin</h3>
        </div>
        
        <div class="sidebar-menu">
            <div class="menu-category">Navigation</div>
            <a href="#" class="menu-link active">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
            
            <div class="menu-category">Management</div>
            <a href="addPackageForm" class="menu-link">
                <i class="fas fa-suitcase"></i>
                <span>Add Package</span>
            </a>
            <a href="viewAllPackages" class="menu-link">
                <i class="fas fa-list-ul"></i>
                <span>View Packages</span>
            </a>
            <a href="addGuide" class="menu-link">
                <i class="fas fa-user-plus"></i>
                <span>Add Guide</span>
            </a>
            <a href="viewAllGuides" class="menu-link">
                <i class="fas fa-users"></i>
                <span>View Guides</span>
            </a>
            <a href="viewAllBookings" class="menu-link">
                <i class="fas fa-calendar-check"></i>
                <span>View Bookings</span>
            </a>
            <a href="viewAllCustomers" class="menu-link">
                <i class="fas fa-user-friends"></i>
                <span>View Customers</span>
            </a>
            
            <div class="menu-category">Settings</div>
            <a href="#" class="menu-link">
                <i class="fas fa-cog"></i>
                <span>Settings</span>
            </a>
            <a href="index" class="menu-link">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>
    </div>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1><i class="fas fa-tachometer-alt"></i> Admin Dashboard</h1>
            <div class="user-info">
                <div class="notification-bell" id="notificationBell">
                    <i class="fas fa-bell"></i>
                    <span class="notification-count">3</span>
                    <div class="notification-popup" id="notificationPopup">
                        <div class="notification-header">
                            <h4>Notifications</h4>
                            <a href="#">Mark all as read</a>
                        </div>
                        <div class="notification-item unread">
                            <strong>New booking received</strong>
                            <p>Customer booked Bali package</p>
                        </div>
                        <div class="notification-item unread">
                            <strong>Payment received</strong>
                            <p>$450 for Maldives trip</p>
                        </div>
                        <div class="notification-item">
                            <strong>New customer registered</strong>
                            <p>John Doe joined</p>
                        </div>
                        <div class="notification-footer">
                            <a href="#">View all notifications</a>
                        </div>
                    </div>
                </div>
                <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Admin Profile">
                <span>Admin User</span>
            </div>
        </div>
        
        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <div class="card">
                <div class="card-header">
                    <div>
                        <h3>Total Packages</h3>
                        <h2>24</h2>
                        <div class="card-trend trend-up">
                            <i class="fas fa-arrow-up"></i>
                            <span>12% from last month</span>
                        </div>
                    </div>
                    <div class="card-icon packages">
                        <i class="fas fa-suitcase"></i>
                    </div>
                </div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <div>
                        <h3>Total Bookings</h3>
                        <h2>156</h2>
                        <div class="card-trend trend-up">
                            <i class="fas fa-arrow-up"></i>
                            <span>8% from last month</span>
                        </div>
                    </div>
                    <div class="card-icon bookings">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                </div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <div>
                        <h3>Total Customers</h3>
                        <h2>89</h2>
                        <div class="card-trend trend-down">
                            <i class="fas fa-arrow-down"></i>
                            <span>3% from last month</span>
                        </div>
                    </div>
                    <div class="card-icon customers">
                        <i class="fas fa-user-friends"></i>
                    </div>
                </div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <div>
                        <h3>Active Guides</h3>
                        <h2>15</h2>
                        <div class="card-trend trend-up">
                            <i class="fas fa-arrow-up"></i>
                            <span>5% from last month</span>
                        </div>
                    </div>
                    <div class="card-icon guides">
                        <i class="fas fa-users"></i>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Recent Activity -->
        <div class="recent-activity">
            <h3 class="section-title">
                <i class="fas fa-history"></i>
                Recent Activity
            </h3>
            
            <div class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-suitcase"></i>
                </div>
                <div class="activity-content">
                    <h4>New package added</h4>
                    <p>Bali Adventure Package was added to the system</p>
                </div>
                <div class="activity-time">10 min ago</div>
            </div>
            
            <div class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-user-plus"></i>
                </div>
                <div class="activity-content">
                    <h4>New guide registered</h4>
                    <p>Michael Brown joined as a new tour guide</p>
                </div>
                <div class="activity-time">45 min ago</div>
            </div>
            
            <div class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="activity-content">
                    <h4>Booking confirmed</h4>
                    <p>Sarah Johnson booked Paris Vacation Package</p>
                </div>
                <div class="activity-time">2 hours ago</div>
            </div>
            
            <div class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-comment-dollar"></i>
                </div>
                <div class="activity-content">
                    <h4>Payment received</h4>
                    <p>$1,200 payment for European Tour</p>
                </div>
                <div class="activity-time">5 hours ago</div>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <h3 class="section-title" style="margin-top: 30px;">
            <i class="fas fa-bolt"></i>
            Quick Actions
        </h3>
        
        <div class="quick-actions">
            <button class="action-btn">
                <i class="fas fa-plus-circle"></i>
                Add Package
            </button>
            
            <button class="action-btn">
                <i class="fas fa-user-plus"></i>
                Add Guide
            </button>
            
            <button class="action-btn">
                <i class="fas fa-chart-line"></i>
                View Reports
            </button>
            
            <button class="action-btn">
                <i class="fas fa-envelope"></i>
                Send Newsletter
            </button>
        </div>
    </div>
</div>

<script>
// Notification toggle
document.getElementById('notificationBell').addEventListener('click', function() {
    document.getElementById('notificationPopup').classList.toggle('show');
});

// Close notification when clicking outside
document.addEventListener('click', function(event) {
    const notificationPopup = document.getElementById('notificationPopup');
    const notificationBell = document.getElementById('notificationBell');
    
    if (!notificationBell.contains(event.target) && !notificationPopup.contains(event.target)) {
        notificationPopup.classList.remove('show');
    }
});

// Sample animation for cards on load
document.addEventListener('DOMContentLoaded', function() {
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, index) => {
        card.style.animationDelay = `${index * 0.1}s`;
    });
    
    // Simulate loading data
    setTimeout(() => {
        document.querySelector('.notification-count').textContent = '0';
    }, 2000);
});
</script>
</body>
</html>