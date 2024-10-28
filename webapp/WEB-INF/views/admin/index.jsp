<%@ include file="../base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Seller Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f7f8;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        
        .sidebar {
        margin-top:100px;
            width: 250px;
            background-color: black;
             opacity: 0.6;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            display: flex;
            flex-direction: column;
        }
        
        .sidebar a {
            display: block;
            color: white;
            padding: 15px;
            text-decoration: none;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: background-color 0.3s;
            font-size: 16px;
        }
        
        .sidebar a:hover {
            background-color: #0056b3;
        }
      
        .sidebar p {
            font-size: 20px;
            font-weight: bold;
            color: white;
            margin-bottom: 30px;
        }
        
        .content {
            margin-left: 250px;
            padding: 20px;
            flex-grow: 1;
            height: 100%;
            width: calc(100% - 250px); /* Fill remaining width */
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            transition: background 0.3s, backdrop-filter 0.3s; /* Smooth transition */
        }
        
        /* Glass effect */
        .glass-effect {
            background: rgba(255, 255, 255, 0.5); /* Background with some transparency */
            backdrop-filter: blur(10px); /* Frosted glass effect */
            border-radius: 10px; /* Rounded corners */
            padding: 20px; /* Padding for the content */
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }
            .content {
                margin-left: 200px;
                width: calc(100% - 200px);
            }
        }
        
        @media (max-width: 576px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>

    <script>
        // Function to dynamically load content based on the sidebar link clicked
        function loadContent(page) {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', page, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Add glass effect class to content
                    document.getElementById('content').classList.add('glass-effect');
                    document.getElementById('content').innerHTML = xhr.responseText;

                    // Remove glass effect class after a short delay for transition
                    setTimeout(() => {
                        document.getElementById('content').classList.remove('glass-effect');
                    }, 500);
                }
            };
            xhr.send();
        }

        // Load default content (Add Product section) when the page loads
        window.onload = function() {
            loadContent('/admin/loadAddProduct'); // Default content
        };
    </script>
</head>
<body>
    <div class="sidebar">
        <p>Seller Dashboard</p>
        <a href="javascript:void(0);" onclick="loadContent('/admin/loadAddProduct');">Add Product</a>
        <a href="javascript:void(0);" onclick="loadContent('/admin/category');">Add Category</a>
        <a href="javascript:void(0);" onclick="loadContent('/admin/products');">View Product</a>
        <a href="javascript:void(0);" onclick="loadContent('/admin/orders');">Orders</a>
        <a href="javascript:void(0);" onclick="loadContent('/admin/users?type=1');">Users</a>
        <a href="javascript:void(0);" onclick="loadContent('/admin/add-admin');">Add Admin</a>
        <a href="javascript:void(0);" onclick="loadContent('/admin/users?type=2');">Admin</a>
    </div>

    <div class="content" id="content">
        <!-- Dynamic content will load here -->
        <h2>Welcome to the Seller Dashboard</h2>
        <p>Select an option from the menu to get started.</p>
    </div>
</body>
</html>
