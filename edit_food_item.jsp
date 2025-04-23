<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Food Item</title>
</head>
<body>
    <h2>Edit Food Item</h2>
    <form action="edit_food_item" method="post">
        <label for="food_id">Food ID:</label>
        <input type="text" name="food_id" required><br><br>

        <label for="food_name">Food Name:</label>
        <input type="text" name="food_name" required><br><br>

        <label for="category">Category:</label>
        <select name="category" required>
            <option value="Burger">Burger</option>
            <option value="Pizza">Pizza</option>
            <option value="Drink">Drink</option>
            <option value="Noodle">Noodle</option>
            <option value="Sandwich">Sandwich</option>
            <option value="Fries">Fries</option>
        </select>
        <br><br>

        <label for="price">Price:</label>
        <input type="text" name="price" required><br><br>

        <input type="submit" value="Update Food Item">
    </form>
</body>
</html>
--%>










<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Food Item</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: left;
            padding: 20px;
        }

        h2 {
            color: #333;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
        }

        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="file"] {
            padding: 5px;
        }

        input[type="submit"] {
            background: #28a745;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #218838;
        }
    </style>
    <script>
        // Show alert message if available
        function showAlert() {
            var msg = "<%= request.getParameter("msg") != null ? request.getParameter("msg") : "" %>";
            if (msg !== "") {
                alert(msg);
            }
        }
    </script>
</head>
<body onload="showAlert()">
    <h2><b><center>Edit Food Item</b></center></h2>
    <form action="edit_food_item" method="post" enctype="multipart/form-data">
        <label for="food_id">Food ID:</label>
        <input type="text" name="food_id" required><br><br>

        <label for="food_name">Food Name:</label>
        <input type="text" name="food_name" required><br><br>

        <label for="category">Category:</label>
        <select name="category" required>
            <option value="Burger">Burger</option>
            <option value="Pizza">Pizza</option>
            <option value="Drink">Drink</option>
            <option value="Noodle">Noodle</option>
            <option value="Sandwich">Sandwich</option>
            <option value="Fries">Fries</option>
        </select>
        <br><br>

        <label for="price">Price:</label>
        <input type="text" name="price" required><br><br>
        
         <label for="image">New Image:</label>
        <input type="file" name="image"><br><br>

        <input type="submit" value="Update Food Item">
    </form>
</body>
</html>
