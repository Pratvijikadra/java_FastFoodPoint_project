<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings - Fast Food Point</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
        }

        header {
            background-color: #1a73e8;
            padding: 15px 30px;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            text-transform: uppercase;
        }

        .back-btn {
            padding: 10px 20px;
            border: none;
            background-color: #f44336;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s, background-color 0.3s;
        }

        .back-btn:hover {
            transform: scale(1.1);
            background-color: #d32f2f;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #1a73e8;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 1rem;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
        }

        button {
            padding: 10px 20px;
            font-size: 1rem;
            background-color: #1a73e8;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s, background-color 0.3s;
        }

        button:hover {
            transform: scale(1.05);
            background-color: #0b57d0;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="logo">Fast Food Point - Settings</div>
        <button class="back-btn" onclick="window.location.href='admin_dashboard.jsp';">Back to Dashboard</button>
    </header>

    <!-- Settings Form -->
    <div class="container">
        <h1>Settings</h1>
        <form action="settings" method="post">
            <!-- Admin Account Details -->
            <div>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
           

            <!-- Password Update -->
            <div>
                <label for="current_password">Current Password:</label>
                <input type="password" id="current_password" name="current_password" placeholder="Enter current password" required>
            </div>
            <div>
                <label for="new_password">New Password:</label>
                <input type="password" id="new_password" name="new_password" placeholder="Enter new password" required>
            </div>
            <div>
                <label for="confirm_password">Confirm New Password:</label>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm new password" required>
            </div>

            
          
            <!-- Submit Button -->
            <button type="submit">Save Changes</button>
        </form>
    </div>
</body>
</html>
