<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analytics - Fast Food Point</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        canvas {
            background: #fff;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <h1>Sales & Performance Analytics</h1>
    <div class="container">
        <h2>Monthly Sales</h2>
        <canvas id="salesChart"></canvas>
        
        <h2>Top Selling Items</h2>
        <canvas id="topItemsChart"></canvas>
    </div>

    <script>
        const salesCtx = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(salesCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                datasets: [{
                    label: 'Revenue ($)',
                    data: [500, 800, 1200, 1500, 2000, 2500, 3000],
                    borderColor: '#1a73e8',
                    backgroundColor: 'rgba(26, 115, 232, 0.2)',
                    borderWidth: 2
                }]
            }
        });

        const itemsCtx = document.getElementById('topItemsChart').getContext('2d');
        const topItemsChart = new Chart(itemsCtx, {
            type: 'bar',
            data: {
                labels: ['Burger', 'Pizza', 'Fries', 'Drink', 'Noodle','Sandwich'],
                datasets: [{
                    label: 'Orders',
                    data: [100, 85, 75, 60, 50,43],
                    backgroundColor: ['#ff4757', '#1e90ff', '#2ed573', '#f9ca24', '#e84393','#800080']
                }]
            }
        });
    </script>
</body>
</html>
--%>

















<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analytics - Fast Food Point</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        canvas {
            background: #fff;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            
        }
        
    
.chart-container {
    width: 400px;  /* Adjust width */
    height: 400px; /* Adjust height */
    margin: auto;  /* Center the chart */
}


        
    </style>
</head>
<body>
    <h1>Sales & Performance Analytics</h1>
    <div class="container">
        <h2>Monthly Sales</h2>
        <p>This graph shows the revenue generated each month.</p>
        <canvas id="salesChart"></canvas>
        
        <h2>Top Selling Items</h2>
        <p>These are the most popular food items ordered by customers.</p>
        <canvas id="topItemsChart"></canvas>
        
        <h2>Customer Engagement</h2>
        <p>Track the number of active customers and their feedback.</p>
       <!-- <canvas id="customerEngagementChart"></canvas>-->
       <div class="chart-container">
    <canvas id="customerEngagementChart"></canvas>
</div>
    </div>

    <script>
        const salesCtx = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(salesCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                datasets: [{
                    label: 'Revenue ($)',
                    data: [500, 800, 1350, 1000, 2000, 1500, 2500],
                    borderColor: '#1a73e8',
                    backgroundColor: 'rgba(26, 115, 232, 0.2)',
                    borderWidth: 2
                }]
            }
        });

        const itemsCtx = document.getElementById('topItemsChart').getContext('2d');
        const topItemsChart = new Chart(itemsCtx, {
            type: 'bar',
            data: {
                labels: ['Burger', 'Pizza', 'Fries', 'Drink', 'Noodle','Sandwich'],
                datasets: [{
                    label: 'Orders',
                    data: [100, 85, 75, 60, 50,39],
                    backgroundColor: ['#008B8B', '#1e90ff', '#2ed573', '#f9ca24', '#e84393','#800080']
                }]
            }
        });
        
        const customerCtx = document.getElementById('customerEngagementChart').getContext('2d');
      //  canvas.width = 500; // Set internal resolution
        //canvas.height = 500;
        const customerEngagementChart = new Chart(customerCtx, {
            type: 'doughnut',
            data: {
                labels: ['Active Customers', 'Inactive Customers'],
                datasets: [{
                    label: 'Customer Engagement',
                    data: [300, 120],
                    backgroundColor: ['#2ed573', '#ff4757']
                }]
            }
        });
    </script>
</body>
</html>
