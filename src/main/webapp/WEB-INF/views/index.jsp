<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TourMate - Explore the World</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
    }
    
    body {
        font-family: 'Poppins', sans-serif;
        color: var(--text);
        line-height: 1.6;
        overflow-x: hidden;
        background-color: var(--light);
    }
    
    /* 3D Navbar */
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
    
    nav ul {
        display: flex;
        list-style: none;
    }
    
    nav ul li {
        margin-left: 30px;
        perspective: 1000px;
    }
    
    nav ul li a {
        text-decoration: none;
        color: var(--text);
        font-weight: 500;
        font-size: 16px;
        letter-spacing: 1px;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        display: inline-block;
        padding: 5px 0;
        position: relative;
        transform-style: preserve-3d;
    }
    
    nav ul li a::before {
        content: '';
        position: absolute;
        width: 100%;
        height: 2px;
        bottom: 0;
        left: 0;
        background-color: var(--primary);
        transform: scaleX(0) translateZ(10px);
        transform-origin: bottom right;
        transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }
    
    nav ul li a:hover {
        color: var(--primary);
        transform: translateY(-5px) translateZ(15px) rotateX(10deg);
        text-shadow: 0 5px 15px rgba(0, 128, 128, 0.3);
    }
    
    nav ul li a:hover::before {
        transform: scaleX(1) translateZ(15px);
        transform-origin: bottom left;
    }
    
    .auth-buttons {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    
    .auth-btn {
        padding: 10px 25px;
        border-radius: 30px;
        font-weight: 500;
        text-decoration: none;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        transform-style: preserve-3d;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }
    
    .sign-in {
        color: var(--primary);
        border: 2px solid var(--primary);
        background: transparent;
    }
    
    .sign-in:hover {
        background: var(--primary);
        color: var(--white);
        transform: translateY(-3px) translateZ(10px);
        box-shadow: 0 8px 25px rgba(0, 128, 128, 0.3);
    }
    
    .sign-up {
        background: var(--primary);
        color: var(--white);
    }
    
    .sign-up:hover {
        background: var(--secondary);
        transform: translateY(-3px) translateZ(10px);
        box-shadow: 0 8px 25px rgba(0, 128, 128, 0.3);
    }
    
    /* 3D Hero Section */
    .hero {
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: var(--white);
        padding: 0 20px;
        position: relative;
        overflow: hidden;
        background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                    url('https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }
    
    .hero-content {
        transform-style: preserve-3d;
        perspective: 1000px;
        max-width: 900px;
    }
    
    h1 {
        font-family: 'Playfair Display', serif;
        font-size: 4.5rem;
        margin-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 2px;
        text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
        animation: fadeInUp 1s ease both;
        transform: translateZ(50px);
    }
    
    .hero p {
        font-size: 1.3rem;
        margin-bottom: 40px;
        animation: fadeInUp 1s ease 0.3s both;
        transform: translateZ(40px);
    }
    
    .cta-button {
        display: inline-block;
        background: var(--accent);
        color: var(--white);
        padding: 15px 45px;
        border-radius: 50px;
        text-decoration: none;
        font-weight: 600;
        font-size: 1.1rem;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        animation: fadeInUp 1s ease 0.6s both;
        box-shadow: 0 10px 30px rgba(255, 165, 0, 0.4);
        transform-style: preserve-3d;
        position: relative;
        overflow: hidden;
        transform: translateZ(30px);
    }
    
    .cta-button:hover {
        background: #e69500;
        transform: translateY(-5px) translateZ(20px) rotateX(10deg);
        box-shadow: 0 15px 40px rgba(255, 165, 0, 0.6);
    }
    
    .cta-button::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(45deg, transparent 25%, rgba(255, 255, 255, 0.1) 50%, transparent 75%);
        background-size: 400% 400%;
        transform: translateZ(0);
        transition: all 0.6s ease;
    }
    
    .cta-button:hover::after {
        animation: shine 1.5s infinite;
    }
    
    @keyframes shine {
        0% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
    
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px) translateZ(0);
        }
        to {
            opacity: 1;
            transform: translateY(0) translateZ(50px);
        }
    }
    
    /* Floating World Map Background */
    .world-map {
        position: absolute;
        width: 150%;
        height: 150%;
        background: url('https://cdn.pixabay.com/photo/2017/01/18/08/25/social-1989152_1280.png') center/contain no-repeat;
        opacity: 0.1;
        animation: floatMap 60s linear infinite;
        z-index: -1;
    }
    
    @keyframes floatMap {
        0% { transform: translate(-25%, -25%) rotate(0deg); }
        100% { transform: translate(-25%, -25%) rotate(360deg); }
    }
    
    /* Stats Section */
    .stats {
        padding: 80px 5%;
        background: var(--white);
        text-align: center;
        transform-style: preserve-3d;
    }
    
    .stats-container {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        max-width: 1200px;
        margin: 0 auto;
        gap: 30px;
    }
    
    .stat-card {
        background: var(--white);
        padding: 40px 30px;
        border-radius: 15px;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.05);
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        transform-style: preserve-3d;
        perspective: 1000px;
        flex: 1 1 200px;
    }
    
    .stat-card:hover {
        transform: translateY(-10px) translateZ(20px) rotateY(5deg);
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.1);
    }
    
    .stat-card h3 {
        font-size: 3rem;
        color: var(--primary);
        margin-bottom: 10px;
    }
    
    .stat-card p {
        color: var(--text);
        font-size: 1.1rem;
    }
    
    /* Categories Section */
    .categories {
        padding: 80px 5%;
        background: var(--light);
        text-align: center;
    }
    
    .section-title {
        font-family: 'Playfair Display', serif;
        font-size: 2.5rem;
        color: var(--primary);
        margin-bottom: 50px;
        position: relative;
        display: inline-block;
        transform: translateZ(30px);
    }
    
    .section-title::after {
        content: '';
        position: absolute;
        width: 80px;
        height: 4px;
        background: var(--accent);
        bottom: -15px;
        left: 50%;
        transform: translateX(-50%);
    }
    
    .categories-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 30px;
        max-width: 1200px;
        margin: 0 auto;
    }
    
    .category-card {
        background: var(--white);
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.05);
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        transform-style: preserve-3d;
        perspective: 1000px;
        position: relative;
    }
    
    .category-card:hover {
        transform: translateY(-10px) translateZ(20px) rotateX(5deg);
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.1);
    }
    
    .category-card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .category-card:hover img {
        transform: scale(1.1);
    }
    
    .category-info {
        padding: 25px;
        position: relative;
        z-index: 1;
        background: var(--white);
    }
    
    .category-info h3 {
        margin-bottom: 15px;
        color: var(--primary);
    }
    
    .category-info p {
        color: var(--text);
        margin-bottom: 20px;
    }
    
    .category-link {
        display: inline-block;
        color: var(--primary);
        font-weight: 500;
        text-decoration: none;
        transition: all 0.3s ease;
    }
    
    .category-link:hover {
        color: var(--secondary);
        transform: translateX(5px);
    }
    
    .category-link i {
        margin-left: 5px;
        transition: all 0.3s ease;
    }
    
    .category-link:hover i {
        transform: translateX(3px);
    }
    
    /* Testimonials Section */
    .testimonials {
        padding: 100px 5%;
        background: var(--white);
        text-align: center;
        position: relative;
        overflow: hidden;
    }
    
    .testimonials::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        opacity: 0.1;
        z-index: 0;
    }
    
    .testimonials-container {
        position: relative;
        z-index: 1;
        max-width: 1200px;
        margin: 0 auto;
    }
    
    .testimonial-cards {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 30px;
        margin-top: 50px;
    }
    
    .testimonial-card {
        background: var(--white);
        border-radius: 15px;
        padding: 40px 30px;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.05);
        width: 350px;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        transform-style: preserve-3d;
        perspective: 1000px;
        position: relative;
        overflow: hidden;
    }
    
    .testimonial-card:hover {
        transform: translateY(-10px) translateZ(20px) rotateY(5deg);
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.1);
    }
    
    .testimonial-card::before {
        content: '"';
        position: absolute;
        font-family: 'Playfair Display', serif;
        font-size: 120px;
        color: rgba(0, 128, 128, 0.1);
        top: -30px;
        left: 10px;
        line-height: 1;
        z-index: 0;
    }
    
    .client-info {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        position: relative;
        z-index: 1;
    }
    
    .client-avatar {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        object-fit: cover;
        margin-right: 15px;
        border: 3px solid var(--primary);
    }
    
    .client-details h4 {
        color: var(--primary);
        margin-bottom: 5px;
        text-align: left;
    }
    
    .client-details .date {
        color: #777;
        font-size: 0.9rem;
        text-align: left;
    }
    
    .testimonial-text {
        font-style: italic;
        margin-bottom: 20px;
        position: relative;
        z-index: 1;
        text-align: left;
    }
    
    .rating {
        color: var(--accent);
        font-size: 1.2rem;
        position: relative;
        z-index: 1;
    }
    
    /* Login Section */
    .login-section {
        padding: 100px 5%;
        background: linear-gradient(135deg, var(--primary), var(--secondary));
        color: var(--white);
        text-align: center;
        position: relative;
        overflow: hidden;
    }
    
    .login-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('https://images.unsplash.com/photo-1483728642387-6c3bdd6c93e5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        opacity: 0.1;
        z-index: 0;
    }
    
    .login-container {
        position: relative;
        z-index: 1;
        max-width: 1200px;
        margin: 0 auto;
    }
    
    .login-options {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 30px;
        margin-top: 50px;
    }
    
    .login-card {
        background: rgba(255, 255, 255, 0.9);
        border-radius: 15px;
        padding: 40px 30px;
        width: 300px;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        transform-style: preserve-3d;
        perspective: 1000px;
    }
    
    .login-card:hover {
        transform: translateY(-10px) translateZ(20px) rotateY(5deg);
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
    }
    
    .login-card h3 {
        color: var(--primary);
        margin-bottom: 20px;
    }
    
    .login-card p {
        color: var(--text);
        margin-bottom: 25px;
    }
    
    .login-btn {
        display: inline-block;
        background: var(--primary);
        color: var(--white);
        padding: 12px 30px;
        border-radius: 50px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
    }
    
    .login-btn:hover {
        background: var(--secondary);
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
    
    /* Footer */
    footer {
        background: var(--dark);
        color: var(--white);
        padding: 80px 5% 40px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 40px;
        position: relative;
    }
    
    .footer-logo {
        font-size: 24px;
        font-weight: 700;
        color: var(--white);
        margin-bottom: 20px;
        display: inline-block;
    }
    
    .footer-about p {
        color: #ccc;
        margin-bottom: 20px;
    }
    
    .social-links {
        display: flex;
        gap: 15px;
    }
    
    .social-link {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.1);
        color: var(--white);
        transition: all 0.3s ease;
    }
    
    .social-link:hover {
        background: var(--primary);
        transform: translateY(-3px);
    }
    
    .footer-links h3 {
        color: var(--accent);
        margin-bottom: 25px;
        font-size: 1.2rem;
        position: relative;
    }
    
    .footer-links h3::after {
        content: '';
        position: absolute;
        width: 40px;
        height: 3px;
        background: var(--primary);
        bottom: -10px;
        left: 0;
    }
    
    .footer-links ul {
        list-style: none;
    }
    
    .footer-links li {
        margin-bottom: 15px;
    }
    
    .footer-links a {
        color: #ccc;
        text-decoration: none;
        transition: all 0.3s ease;
        display: inline-block;
    }
    
    .footer-links a:hover {
        color: var(--accent);
        transform: translateX(5px);
    }
    
    .footer-contact p {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
        color: #ccc;
    }
    
    .footer-contact i {
        margin-right: 10px;
        color: var(--primary);
    }
    
    .copyright {
        text-align: center;
        padding: 20px;
        background: var(--secondary);
        color: var(--white);
        grid-column: 1 / -1;
    }
    
    /* Floating Elements Animation */
    @keyframes float {
        0% { transform: translateY(0px) translateZ(0); }
        50% { transform: translateY(-15px) translateZ(10px); }
        100% { transform: translateY(0px) translateZ(0); }
    }
    
    .floating {
        animation: float 4s ease-in-out infinite;
    }
    
    /* Scroll Reveal Animation */
    .reveal {
        opacity: 0;
        transform: translateY(30px);
        transition: all 0.6s ease;
    }
    
    .reveal.active {
        opacity: 1;
        transform: translateY(0);
    }
    
    /* Responsive Design */
    @media (max-width: 992px) {
        h1 {
            font-size: 3.5rem;
        }
        
        nav ul li {
            margin-left: 20px;
        }
    }
    
    @media (max-width: 768px) {
        header {
            flex-direction: column;
            padding: 15px;
        }
        
        .logo {
            margin-bottom: 15px;
        }
        
        nav ul {
            margin-bottom: 15px;
        }
        
        nav ul li {
            margin-left: 15px;
        }
        
        h1 {
            font-size: 2.8rem;
        }
        
        .hero p {
            font-size: 1.1rem;
        }
    }
    
    @media (max-width: 576px) {
        h1 {
            font-size: 2.2rem;
        }
        
        nav ul {
            flex-wrap: wrap;
            justify-content: center;
        }
        
        nav ul li {
            margin: 5px 10px;
        }
        
        .auth-buttons {
            margin-top: 15px;
        }
    }
</style>
</head>
<body>
    <!-- Header with 3D Navbar -->
    <header id="header">
        <div class="logo">TourMate</div>
        <nav>
            <ul>
                <li><a href="#" class="nav-link">Home</a></li>
                <li><a href="#" class="nav-link">About Us</a></li>
                <li><a href="#" class="nav-link">Destinations</a></li>
                <li><a href="#" class="nav-link">Services</a></li>
                <li><a href="#" class="nav-link">Activities</a></li>
                <li><a href="#" class="nav-link">Blog</a></li>
                <li><a href="#" class="nav-link">Contact Us</a></li>
            </ul>
        </nav>
        <div class="auth-buttons">
            <a href="customerLogin" class="auth-btn sign-in">Sign In</a>
            <a href="customerRegister" class="auth-btn sign-up">Register</a>
        </div>
    </header>

    <!-- Hero Section with Parallax -->
    <section class="hero">
        <div class="world-map"></div>
        <div class="hero-content">
            <h1>Explore The World With Us</h1>
            <p>Discover breathtaking destinations and create unforgettable memories with TourMate. Your perfect adventure starts here.</p>
            <a href="#" class="cta-button floating">Book Your Tour</a>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats">
        <div class="stats-container">
            <div class="stat-card reveal">
                <h3>97%</h3>
                <p>Customer Satisfaction</p>
            </div>
            <div class="stat-card reveal">
                <h3>19K+</h3>
                <p>Happy Travelers</p>
            </div>
            <div class="stat-card reveal">
                <h3>12</h3>
                <p>Years Experience</p>
            </div>
            <div class="stat-card reveal">
                <h3>8K+</h3>
                <p>Tours Completed</p>
            </div>
        </div>
    </section>

    <!-- Tour Categories Section -->
    <section class="categories">
        <h2 class="section-title reveal">Our Tour Categories</h2>
        <div class="categories-grid">
            <div class="category-card reveal">
                <img src="https://images.unsplash.com/photo-1501555088652-021faa106b9b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Walking Tours">
                <div class="category-info">
                    <h3>Walking Tours</h3>
                    <p>Explore cities on foot with our expert local guides and discover hidden gems.</p>
                    <a href="#" class="category-link">Explore <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="category-card reveal">
                <img src="https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Cruises">
                <div class="category-info">
                    <h3>Cruises</h3>
                    <p>Luxury voyages to the world's most beautiful coastal destinations.</p>
                    <a href="#" class="category-link">Explore <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="category-card reveal">
                <img src="https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Hiking">
                <div class="category-info">
                    <h3>Hiking Adventures</h3>
                    <p>Challenge yourself with breathtaking trails and stunning mountain views.</p>
                    <a href="#" class="category-link">Explore <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="category-card reveal">
                <img src="https://images.unsplash.com/photo-1436491865332-7a61a109cc05?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Air Tours">
                <div class="category-info">
                    <h3>Air Tours</h3>
                    <p>See the world from above with our helicopter and hot air balloon experiences.</p>
                    <a href="#" class="category-link">Explore <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials">
        <div class="testimonials-container">
            <h2 class="section-title reveal">What Our Clients Say</h2>
            <div class="testimonial-cards">
                <div class="testimonial-card reveal">
                    <div class="client-info">
                        <img src="https://randomuser.me/api/portraits/women/43.jpg" alt="Sarah Johnson" class="client-avatar">
                        <div class="client-details">
                            <h4>Sarah Johnson</h4>
                            <span class="date">2 days ago</span>
                        </div>
                    </div>
                    <p class="testimonial-text">"Our tour guide in Rome was incredibly knowledgeable and made the ancient city come alive. The accommodations were perfect and the itinerary balanced sightseeing with relaxation."</p>
                    <div class="rating"></div>
                </div>
                <div class="testimonial-card reveal">
                    <div class="client-info">
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Michael Chen" class="client-avatar">
                        <div class="client-details">
                            <h4>Michael Chen</h4>
                            <span class="date">1 week ago</span>
                        </div>
                    </div>
                    <p class="testimonial-text">"The African safari organized by TourMate exceeded all expectations. We saw the Big Five within two days and our guide's wildlife expertise was remarkable."</p>
                    <div class="rating"></div>
                </div>
                <div class="testimonial-card reveal">
                    <div class="client-info">
                        <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="Emma Rodriguez" class="client-avatar">
                        <div class="client-details">
                            <h4>Emma Rodriguez</h4>
                            <span class="date">3 weeks ago</span>
                        </div>
                    </div>
                    <p class="testimonial-text">"As a solo female traveler, I felt completely safe and cared for throughout my Southeast Asia tour. The local guides were professional and the experiences authentic."</p>
                    <div class="rating"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Login Section -->
    <section class="login-section">
        <div class="login-container">
            <h2 class="section-title reveal">Tour Management System</h2>
            <p class="reveal" style="color: white; max-width: 800px; margin: 0 auto 40px;">Access your account or register as a new user to start planning your next adventure.</p>
            <div class="login-options">
                <div class="login-card reveal">
                    <h3>Admin Login</h3>
                    <p>Access the administration panel to manage tours, guides, and customers.</p>
                    <a href="adminLogin" class="login-btn">Admin Login</a>
                </div>
                <div class="login-card reveal">
                    <h3>Tour Guide</h3>
                    <p>Register or login to manage your tours and connect with travelers.</p>
                    <div style="display: flex; gap: 10px; justify-content: center;">
                        <a href="guideRegister" class="login-btn" style="background: var(--accent);">Register</a>
                        <a href="guideLogin" class="login-btn">Login</a>
                    </div>
                </div>
                <div class="login-card reveal">
                    <h3>Customer</h3>
                    <p>Register or login to book tours and manage your reservations.</p>
                    <div style="display: flex; gap: 10px; justify-content: center;">
                        <a href="customerRegister" class="login-btn" style="background: var(--accent);">Register</a>
                        <a href="customerLogin" class="login-btn">Login</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-about">
            <div class="footer-logo">TourMate</div>
            <p>We are dedicated to providing unforgettable travel experiences with exceptional service and attention to detail.</p>
            <div class="social-links">
                <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
        <div class="footer-links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Destinations</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <h3>Support</h3>
            <ul>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms of Service</a></li>
                <li><a href="#">Cancellation Policy</a></li>
            </ul>
        </div>
        <div class="footer-contact">
            <h3>Contact Us</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123 Travel Street, Tour City, TC 12345</p>
            <p><i class="fas fa-phone-alt"></i> +1 (234) 567-8900</p>
            <p><i class="fas fa-envelope"></i> info@tourmate.com</p>
            <p><i class="fas fa-clock"></i> Mon-Fri: 9AM - 6PM</p>
        </div>
        <div class="copyright">
            &copy; 2025 TourMate. All rights reserved.
        </div>
    </footer>

    <!-- JavaScript for Interactive Elements -->
    <script>
        // Header scroll effect
        window.addEventListener('scroll', function() {
            const header = document.getElementById('header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
        
        // Scroll reveal animation
        function reveal() {
            const reveals = document.querySelectorAll('.reveal');
            
            for (let i = 0; i < reveals.length; i++) {
                const windowHeight = window.innerHeight;
                const elementTop = reveals[i].getBoundingClientRect().top;
                const elementVisible = 150;
                
                if (elementTop < windowHeight - elementVisible) {
                    reveals[i].classList.add('active');
                } else {
                    reveals[i].classList.remove('active');
                }
            }
        }
        
        window.addEventListener('scroll', reveal);
        reveal(); // Initialize
        
        // 3D hover effect for cards
        document.querySelectorAll('.category-card, .testimonial-card, .login-card').forEach(card => {
            card.addEventListener('mousemove', (e) => {
                const x = e.clientX - card.getBoundingClientRect().left;
                const y = e.clientY - card.getBoundingClientRect().top;
                
                const centerX = card.offsetWidth / 2;
                const centerY = card.offsetHeight / 2;
                
                const angleX = (y - centerY) / 20;
                const angleY = (centerX - x) / 20;
                
                card.style.transform = `rotateX(${angleX}deg) rotateY(${angleY}deg) translateZ(20px)`;
            });
            
            card.addEventListener('mouseleave', () => {
                card.style.transform = 'rotateX(0) rotateY(0) translateZ(0)';
            });
        });
    </script>
</body>
</html>