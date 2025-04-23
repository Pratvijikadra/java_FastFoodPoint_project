<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Fast Food Point</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-image: url('images/Contact-Us.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .contact-container {
           // background: rgba(255, 255, 255, 0.5);
            background: rgba(0, 0, 0, 0.4);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            padding: 30px;
            width: 500px;
            text-align: center;
            backdrop-filter: blur(10px);
        }

        .contact-container h1 {
            font-size: 2.5rem;
            color: #ff5722;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

          .contact-container img {
            width: 100px;
            margin-bottom: 20px;
          }
        .contact-container form {
            display: flex;
            flex-direction: column;
        }

        .contact-container input, .contact-container textarea {
            margin: 10px 0;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .contact-container input:focus, .contact-container textarea:focus {
            outline: none;
            border-color: #ff5722;
        }

        .contact-container button {
            background-color: #ff5722;
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .contact-container button:hover {
            background-color: #e64a19;
        }

        .contact-container .info {
            margin-top: 20px;
            font-size: 1rem;
            //color: #555;
            color: white;
        }

        .contact-container .info p {
            margin: 5px 0;
        }

    </style>
</head>
<body>
    <div class="contact-container">
        <img src="images/contact_logo.jpg" alt="Fast Food Point Logo">
       
        <h1>Contact Us</h1>
        <form action="contact" method="post">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
            <button type="submit">Send Message</button>
        </form>
        <div class="info">
            <p><strong>Phone:</strong> +1 123-456-7890</p>
            <p><strong>Email:</strong> support@fastfoodpoint.com</p>
            <p><strong>Address:</strong> 123 Food Street, Flavor Town, USA</p>
        </div>
    </div>
</body>
</html>
