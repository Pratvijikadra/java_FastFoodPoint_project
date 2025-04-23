<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Food Items - Fast Food Point</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            padding: 20px;
        }

        h1 {
            font-weight: bold;
            text-transform: uppercase;
            text-align: center;
            color: #1a73e8;
        }

        .form-container {
            max-width: 600px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #1a73e8;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-group button:hover {
            background-color: #0b57d0;
        }

        .form-group button:disabled {
            background-color: #b0bec5;
        }

        .btn-toggle {
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            width: 30%;
            margin-bottom: 20px;
        }

        .btn-toggle:hover {
          //  background-color: #45a050;
          background-color: green;
        }

        .section {
            display: none;
        }

        .section.active {
            display: block;
        }
    </style>
    <script>
        function showSection(sectionId) {
            var sections = document.querySelectorAll('.section');
            sections.forEach(function(section) {
                section.classList.remove('active');
            });
            document.getElementById(sectionId).classList.add('active');
        }
    </script>
</head>
<body>

    <h1>Manage Food Items</h1>

    <!-- Toggle Buttons for Sections -->
    <button class="btn-toggle" onclick="showSection('addFood')">Add Food Item</button>
   <!-- <button class="btn-toggle" onclick="showSection('editFood')">Edit Food Item</button>-->
   <button class="btn-toggle" onclick="window.location.href='edit_food_item.jsp'">Edit Food Item</button>

    <button class="btn-toggle" onclick="showSection('deleteFood')">Delete Food Item</button>

    <!-- Add Food Item Section -->
    <div id="addFood" class="section active">
        <div class="form-container">
            <form action="manage_food_item" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="foodName">Food Name:</label>
                    <input type="text" id="foodName" name="foodName" required placeholder="Enter the food name">
                </div>

                <div class="form-group">
                    <label for="foodCategory">Food Category:</label>
                    <select id="foodCategory" name="foodCategory" required>
                        <option value="" disabled selected>Select a category</option>
                        <option value="burger">Burger</option>
                        <option value="pizza">Pizza</option>
                        <option value="noodle">Noodle</option>
                        <option value="drink">Drink</option>
                        <option value="sandwich">Sandwich</option>
                        <option value="fries">Fries</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="foodPrice">Food Price ($):</label>
                    <input type="number" id="foodPrice" name="foodPrice" required min="1" step="0.01" placeholder="Enter the price">
                </div>

                <div class="form-group">
                    <label for="foodImage">Food Image:</label>
                    <input type="file" id="foodImage" name="foodImage" accept="image/*" required>
                </div>

                <div class="form-group">
                    <button type="submit">Add Food Item</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Edit Food Item Section -->
   <%-- <div id="editFood" class="section">
        <div class="form-container">
            <form action="edit_food_item_action.jsp" method="POST" enctype="multipart/form-data">
               <div class="form-group">
                <label for="foodId">Food Id:</label>
                <!--<input type="text" id="foodId" name="foodId" value="<%= request.getParameter("foodId") %>">-->
                <input type="text" id="foodId" name="foodId" required value="<%= request.getAttribute("foodId") %>" placeholder="Enter the food id">
               </div>
                <div class="form-group">
                    <label for="foodName">Food Name:</label>
                    <input type="text" id="foodName" name="foodName" required value="<%= request.getAttribute("foodName") %>" placeholder="Enter the food name">
                </div>

                <div class="form-group">
                    <label for="foodCategory">Food Category:</label>
                    <select id="foodCategory" name="foodCategory" required>
                        <option value="<%= request.getAttribute("foodCategory") %>" selected><%= request.getAttribute("foodCategory") %></option>
                       <option value="burger">Burger</option>
                        <option value="pizza">Pizza</option>
                        <option value="noodle">Noodle</option>
                        <option value="drink">Drink</option>
                        <option value="sandwich">Sandwich</option>
                        <option value="fries">Fries</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="foodPrice">Food Price ($):</label>
                    <input type="number" id="foodPrice" name="foodPrice" required min="1" step="0.01" value="<%= request.getAttribute("foodPrice") %>" placeholder="Enter the price">
                </div>

                <div class="form-group">
                    <label for="foodImage">Food Image:</label>
                    <input type="file" id="foodImage" name="foodImage" accept="image/*">
                </div>

                <div class="form-group">
                    <button type="submit">Update Food Item</button>
                </div>
            </form>
        </div>
    </div>  --%>
   
   
  
   <div id="editFood" class="section">
    <div class="form-container">
        <form action="edit_food_item_action.jsp" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="foodId">Food ID:</label>
                <input type="text" id="foodId" name="foodId" requird value="<%= request.getParameter("foodId") %>" placeholder="Enter the food ID">
            </div>

            <div class="form-group">
                <label for="foodName">Food Name:</label>
                <input type="text" id="foodName" name="foodName"  value="<%= request.getAttribute("foodName") %>" placeholder="Enter the food name">
            </div>

            <div class="form-group">
                <label for="foodCategory">Food Category:</label>
                <select id="foodCategory" name="foodCategory" >
                    <option value="burger">Burger</option>
                    <option value="pizza">Pizza</option>
                    <option value="noodle">Noodle</option>
                    <option value="drink">Drink</option>
                    <option value="sandwich">Sandwich</option>
                    <option value="fries">Fries</option>
                </select>
            </div>

            <div class="form-group">
                <label for="foodPrice">Food Price ($):</label>
                <input type="number" id="foodPrice" name="foodPrice"  min="1" step="0.01" value="<%= request.getAttribute("foodPrice") %>" placeholder="Enter the price">
            </div>

            <div class="form-group">
                <label for="foodImage">Food Image:</label>
                <input type="file" id="foodImage" name="foodImage" accept="image/*">
            </div>

            <div class="form-group">
                <button type="submit">Update Food Item</button>
            </div>
        </form>
    </div>
</div>

<script>
    // Auto-select the correct category in the dropdown
    document.addEventListener("DOMContentLoaded", function() {
        var selectedCategory = "<%= request.getAttribute("foodCategory") %>";
        if (selectedCategory) {
            document.getElementById("foodCategory").value = selectedCategory;
        }
    });
</script> 

   
   
   

    <!-- Delete Food Item Section -->
    <div id="deleteFood" class="section">
        <div class="form-container">
            <form action="delete_food_item_action.jsp" method="POST">
                <div class="form-group">
                    <label for="foodId">Enter ID </label>
                      <input type="text" name="foodId" placeholder="Enter ID" required>
                 <!--   <select id="foodId" name="foodId" required>
                      <!--  <option value="" disabled selected>Select food item</option>
                        <!-- Dynamically populate options with food items from the database -->
                    </select>
                </div>

                <div class="form-group">
                    <button type="submit">Delete Food Item</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
