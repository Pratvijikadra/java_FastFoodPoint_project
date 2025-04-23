<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login - Fast Food Point</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('images/loginbg.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .login-container {
          //  background: rgba(255, 255, 255, 0.9);
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            padding: 30px;
            width: 400px;
            text-align: center;
            backdrop-filter: blur(10px);
            
        }

        .login-container h1 {
            font-size: 2.5rem;
            color: #ff5722;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .login-container img {
            width: 100px;
            margin-bottom: 20px;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
        }

        .login-container input {
            margin: 10px 0;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .login-container input:focus {
            outline: none;
            border-color: #ff5722;
        }

        .login-container button {
            background-color: #ff5722;
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-container button:hover {
            background-color: #e64a19;
        }

        .login-container .link {
            margin-top: 15px;
            font-size: 0.9rem;
        }

        .login-container .link a {
            color: #ff5722;
            text-decoration: none;
            font-weight: bold;
        }

        .login-container .link a:hover {
            text-decoration: underline;
        }
        
        
     



    </style>
</head>
<body>
    <div class="login-container">
        <img src="images/ff.png" alt="Fast Food Point Logo">
        <h1>Customer Login</h1>
        <form action="login" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <div class="link">
            <p>New user? <a href="registration.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>








