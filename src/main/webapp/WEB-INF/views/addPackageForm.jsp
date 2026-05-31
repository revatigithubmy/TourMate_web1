<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Travel Package</title>
</head>
<body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 0; padding: 20px; background-image: url('https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'); background-size: cover; background-position: center; min-height: 100vh; display: flex; justify-content: center; align-items: center;">

    <div style="background: rgba(255, 255, 255, 0.95); border-radius: 10px; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); padding: 30px; max-width: 900px; width: 90%;">
        <h2 style="color: #008080; text-align: center; margin-bottom: 25px; font-size: 28px; border-bottom: 2px solid #008080; padding-bottom: 10px;">Add Travel Package</h2>

        <form action="${pageContext.request.contextPath}/submitPackage" method="post" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px;">
            <div style="display: flex; flex-direction: column;">
                <label style="color: #008080; font-weight: 500; margin-bottom: 5px;">Package Name:</label>
                <input type="text" name="package_name" required style="padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;">
            </div>

            <div style="display: flex; flex-direction: column;">
                <label style="color: #008080; font-weight: 500; margin-bottom: 5px;">Location:</label>
                <input type="text" name="location" required style="padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;">
            </div>

            <div style="display: flex; flex-direction: column;">
                <label style="color: #008080; font-weight: 500; margin-bottom: 5px;">Price:</label>
                <input type="text" name="price" required style="padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;">
            </div>

            <div style="display: flex; flex-direction: column;">
                <label style="color: #008080; font-weight: 500; margin-bottom: 5px;">Guide ID:</label>
                <input type="text" name="guide_id" required style="padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;">
            </div>

            <div style="display: flex; flex-direction: column;">
                <label style="color: #008080; font-weight: 500; margin-bottom: 5px;">Guide Name:</label>
                <input type="text" name="guide_name" required style="padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;">
            </div>

            <div style="display: flex; flex-direction: column;">
                <label style="color: #008080; font-weight: 500; margin-bottom: 5px;">Duration (days):</label>
                <input type="text" name="duration" required style="padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;">
            </div>

            <div style="display: flex; flex-direction: column; grid-column: span 2;">
                <label style="color: #008080; font-weight: 500; margin-bottom: 5px;">Description:</label>
                <input type="text" name="description" required style="padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;">
            </div>

            <div style="grid-column: span 2;">
                <input type="submit" value="Add Travel Package" style="background: #008080; color: white; border: none; padding: 12px; font-size: 16px; border-radius: 5px; cursor: pointer; width: 100%; margin-top: 10px; transition: all 0.3s ease;">
            </div>
        </form>
                 <a href="adminDashboard" class="back-btn"> Back to Dashboard</a>
        
    </div>

    <style>
        input[type="text"]:focus {
            border-color: #008080;
            outline: none;
            box-shadow: 0 0 0 3px rgba(0, 128, 128, 0.2);
        }
        input[type="submit"]:hover {
            background: #006666;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }
        
        
        
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
        
        @media (max-width: 768px) {
            form {
                grid-template-columns: 1fr !important;
            }
            div[style*="grid-column: span 2"] {
                grid-column: span 1 !important;
            }
        }
    </style>
</body>
</html>