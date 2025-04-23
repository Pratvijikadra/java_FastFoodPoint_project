<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Fast Food Point</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
           
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
          //  background-image: url('images/admin_bg.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }

        .admin-login-container {
           background: rgba(0.10, 0.10, 0.10, 0.10);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.7);
            border-radius: 15px;
            padding: 30px;
            width: 400px;
            text-align: center;
            color: #fff;
            backdrop-filter: blur(10px);
        }

        .admin-login-container h1 {
            font-size: 2rem;
            color: #ff5722;
            margin-bottom: 20px;
          //  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .admin-login-container img {
            width: 100px;
            margin-bottom: 20px;
        }

        .admin-login-container form {
            display: flex;
            flex-direction: column;
        }

        .admin-login-container input {
            margin: 10px 0;
            padding: 10px;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
        }

        .admin-login-container input:focus {
            outline: none;
            border: 2px solid #ff5722;
        }

        .admin-login-container button {
            background-color: #ff5722;
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .admin-login-container button:hover {
            background-color: #e64a19;
        }

        .admin-login-container .link {
            margin-top: 15px;
            font-size: 0.9rem;
        }

        .admin-login-container .link a {
            color: #ff5722;
            text-decoration: none;
            font-weight: bold;
        }

        .admin-login-container .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="admin-login-container">
        <img src="images/admin_logo.png" alt="Fast Food Point Logo">
        <h1>Admin Login</h1>
        <form action="admin_login" method="post">
            <input type="text" name="username" placeholder="Admin Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <div class="link">
            <p><a href="index.jsp">Back to Home</a></p>
        </div>
    </div>
</body>
</html>
