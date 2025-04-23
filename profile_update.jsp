<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .profile-container {
            background: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            padding: 30px;
            width: 400px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .profile-container h1 {
            font-size: 2.5rem;
            color: #ff5722;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }
         .profile-container img {
            width: 100px;
            margin-bottom: 20px;
        }

        .profile-container form {
            display: flex;
            flex-direction: column;
        }

        .profile-container input {
            margin: 10px 0;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .profile-container input:focus {
            outline: none;
            border-color: #ff5722;
        }

        .profile-container button {
            background-color: #ff5722;
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .profile-container button:hover {
            background-color: #e64a19;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="profile-container" >
        <img src="images/updateprofilelogo.jpg" alt="Fast Food Point Logo">
        <h1>Update Profile</h1>
        <form action="profile_update" method="post">
            <input type="text" name="fullname" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
