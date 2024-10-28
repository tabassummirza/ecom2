<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- Internal CSS -->
    <style>
        body {
            padding-top: 56px;
        }

        .navbar {
            background-color: #000;
            height: 100px;
            opacity:0.8;
        }

        .navbar-brand {
            color: #fff !important;
        }

        .navbar-nav .nav-link {
            color: #fff !important;
            margin-left: 15px; /* Add space between links */
        }

        .navbar-nav .nav-link.active,
        .navbar-nav .nav-link:hover {
            color: #ddd !important;
        }

        .cart-badge {
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 0.8em;
            position: relative;
            top: -6px;
            left: 4px;
        }

     
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="fa-solid fa-cart-shopping"></i> RevShop</a>

         

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <!-- Check if user is logged in or not -->
                    <c:choose>
                        <c:when test="${empty user}">
                            <li class="nav-item"><a class="nav-link ${pageContext.request.requestURI eq '/' ? 'active' : ''}" href="/"><i class="fa-solid fa-house"></i> Home</a></li>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${user.role == 'ROLE_ADMIN'}">
                                <li class="nav-item"><a class="nav-link ${pageContext.request.requestURI eq '/admin/' ? 'active' : ''}" href="/admin/"><i class="fa-solid fa-house"></i> Home</a></li>
                            </c:if>
                            <c:if test="${user.role == 'ROLE_USER'}">
                                <li class="nav-item"><a class="nav-link ${pageContext.request.requestURI eq '/' ? 'active' : ''}" href="/"><i class="fa-solid fa-house"></i> Home</a></li>
                                <li class="nav-item"><a class="nav-link ${pageContext.request.requestURI eq '/user/wishlist' ? 'active' : ''}" href="/user/wishlist"><i class="fa-solid fa-heart"></i> Wishlist</a></li>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    <li class="nav-item"><a class="nav-link ${pageContext.request.requestURI eq '/products' ? 'active' : ''}" href="/products">Product</a></li>

                    <!-- Additional navigation links based on login status -->
                    <c:choose>
                        <c:when test="${empty user}">
                            <li class="nav-item"><a class="nav-link ${pageContext.request.requestURI eq '/signin' ? 'active' : ''}" href="/signin"><i class="fa-solid fa-right-to-bracket"></i> LOGIN</a></li>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${user.role == 'ROLE_USER'}">
                                <li class="nav-item">
                                    <a class="nav-link ${pageContext.request.requestURI eq '/user/cart' ? 'active' : ''}" href="/user/cart">
                                        <i class="fa-solid fa-cart-shopping"></i> Cart <span class="cart-badge">${countCart}</span>
                                    </a>
                                </li>
                            </c:if>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle ${pageContext.request.requestURI eq '/user/profile' || pageContext.request.requestURI eq '/admin/profile' ? 'active' : ''}" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-solid fa-user"></i> ${user.name}
                                </a>
                                <ul class="dropdown-menu">
                                    <c:if test="${user.role == 'ROLE_USER'}">
                                        <li><a class="dropdown-item" href="/user/profile">Profile</a></li>
                                        <li><a class="dropdown-item" href="/user/user-orders">My Orders</a></li>
                                    </c:if>
                                    <c:if test="${user.role == 'ROLE_ADMIN'}">
                                        <li><a class="dropdown-item" href="/admin/profile">Profile</a></li>
                                    </c:if>
                                    <li><a class="dropdown-item" href="/logout">Logout</a></li>
                                </ul>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->


    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
