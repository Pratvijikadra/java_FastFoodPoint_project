<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration - Fast Food Point</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('images/register.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .registration-container {
            background: rgba(255, 255, 255, 0.5);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            padding: 30px;
            width: 400px;
            text-align: center;
            backdrop-filter: blur(10px);
        }

        .registration-container h1 {
            font-size: 2.5rem;
            color: #ff5722;
            margin-bottom: 20px;
        }

        .registration-container img {
            width: 100px;
            margin-bottom: 20px;
        }

        .registration-container form {
            display: flex;
            flex-direction: column;
        }

        .registration-container input {
            margin: 10px 0;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .registration-container input:focus {
            outline: none;
            border-color: #ff5722;
        }

        .registration-container button {
            background-color: #ff5722;
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .registration-container button:hover {
            background-color: #e64a19;
        }

        .registration-container .link {
            margin-top: 15px;
            font-size: 0.9rem;
        }

        .registration-container .link a {
            color: #ff5722;
            text-decoration: none;
            font-weight: bold;
        }

        .registration-container .link a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
    <div class="registration-container">
        <img src="images/ff.png" alt="Fast Food Point Logo">
        <h1>Customer Registration</h1>
        <form action="registration" method="post">
            <input type="text" name="fullname" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="password" name="confirm_password" placeholder="Confirm Password" required>
            <button type="submit">Register</button>
        </form>
        <div class="link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>
