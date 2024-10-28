<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="ISO-8859-1">
    <title>Product Page</title>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  

</head>
    <style>
    body, html {
  height: 25%;
  margin: 0;
}
 
        /* Carousel image settings */
        .carousel-inner img {
            width: 100%;
            height: 350px; /* Adjust as needed */
            object-fit: cover;
        }

        /* Card and category styles */
        .card, .cus-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover, .cus-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card img, .cus-card img {
            width: 100%;
            height: auto; /* Maintain aspect ratio */
            object-fit: cover;
        }

        .card-body, .cus-card .card-body {
            padding: 15px;
        }

        .card-body a, .cus-card .card-body a {
            color: #333;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 500;
        }

        .card-body a:hover, .cus-card .card-body a:hover {
            text-decoration: underline;
        }

        /* Category container in grid format */
        .category-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Adjusted for better width */
            gap: 20px;
            justify-content: center;
        }

        .category-container .card {
            border-radius: 15px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            background-color: #f9f9f9;
        }

        .category-container .card:hover {
            transform: scale(1.05); /* Slightly less aggressive scaling */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .category-container img {
            width: 100%;
            height: 250px; /* Set a fixed height for better visual balance */
            object-fit: cover;
            border-radius: 15px 15px 0 0;
        }

        .category-container .card-body {
            padding: 10px;
            text-align: center;
            background-color: #fff;
        }

        .category-container .card-body a {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }

        .category-container .card-body a:hover {
            color: #027a3e; /* Optional color change on hover */
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .category-container img {
                height: 150px; /* Adjust height for smaller screens */
            }
        }

        @media (max-width: 576px) {
            .category-container img {
                height: 120px; /* Adjust height for very small screens */
            }
        }

        .fs-4 {
            font-size: 2.5rem; /* Font size */
            font-weight: bold; /* Bold text */
            color: black; /* Keep text color black */
            text-align: center; /* Center align text */
            margin-bottom: 20px; /* Bottom margin */
            opacity: 0; /* Start fully transparent */
            transform: translateY(20px); /* Start from below */
            animation: fadeInUp 1s forwards; /* Apply animation */
            animation-delay: 0.5s; /* Optional delay before the animation starts */
            transition: color 0.3s ease, transform 0.3s ease; /* Transition for smooth effects */
        }

        /* Keyframes for the fade-in-up animation */
        @keyframes fadeInUp {
            to {
                opacity: 1; /* End fully visible */
                transform: translateY(0); /* End in original position */
            }
        }

        /* Hover effect */
        .fs-4:hover {
            color: #007bff; /* Change color on hover (you can choose any color) */
            transform: scale(1.1); /* Slightly increase size on hover */
        }
        footer img {
    vertical-align: middle;
}

footer h5 {
    margin: 10px 0;
}

footer p {
    font-size: 0.9rem;
}
      
      .promo-section {
    background-color: #f8f9fa; /* Light background */
    padding: 20px;
    border-radius: 5px;
}

.promo-section .alert {
    margin-bottom: 0; /* Remove default margin */
}

/* Container for the image and text */
.image-container {
    position: relative;
    width: 100%;
    max-width: 100%; /* Adjust as needed */
   
  
}

/* Style the image to fit the container */
.image-container img {
    width: 100%;
    height: 900px;
    display: block;
     margin: 50px auto;
    
}

/* Position welcome-text over the image */
.welcome-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: #fff;
}

/* Styling for the heading */
.welcome-text h1 {
    color: black;
    text-transform: uppercase;
    font-size: 3em;
}

/* Highlighted span inside heading */
.welcome-text h1 span {
    color: red;
}

/* Styling for the contact link */
.welcome-text a {
    border: 1px solid #fff;
    padding: 10px 25px;
    text-decoration: none;
    text-transform: uppercase;
    font-family: 'Poppins', sans-serif;
    font-size: 14px;
    display: inline-block;
    color: black;
    margin-top: 20px;
}

/* Hover effect for the contact link */
.welcome-text a:hover {
    background: #fff;
    color: #333;
}

    </style>
</head>
<body><div class="image-container">
    <img src="/images/10631434.jpg" alt="Background Image">
    <div class="welcome-text">
        <h1>Welcome to <span>RevShop</span></h1>
        <a href="#">Contact Us</a>
    </div>
</div>
 
    <section>
        <!-- Start Slider -->
        
        <div id="carouselAutoplaying" class="carousel slide carousel-dark mt-3 mb-3" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                   <a href="${pageContext.request.contextPath}/products?category=ELECTRONICS"><img src="${pageContext.request.contextPath}/images/3A_3B_PC_Hero_3000x1200._CB543546740_.jpg" class="d-block w-100" alt="Image 1"></a> 
                </div>
                <div class="carousel-item">
                    <a href="${pageContext.request.contextPath}/products?category=TOYS"><img src="${pageContext.request.contextPath}/images/3A_PC_Hero_3000x1200_2._CB543500726_.jpg" class="d-block w-100" alt="Image 2"></a>
                </div>
                <div class="carousel-item">
                    <a href="${pageContext.request.contextPath}/products?category=FASHION"><img src="${pageContext.request.contextPath}/images/dress.png" class="d-block w-100" alt="Image 3"></a>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- end of carousel -->

        <!-- Start Category Module -->
        <div class="container my-5">
            <div class="row text-center">
                <p class="fs-4 mb-4">Categories</p>
                <div class="category-container">
                    <c:forEach var="category" items="${categories}">
                        <div class="card">
                            <div class="product-image-container">
                                <a href="${pageContext.request.contextPath}/products?category=${category.name}">  <img src="${pageContext.request.contextPath}/img/category_img/${category.imageName}" class="img-fluid" alt="${category.name}"></a>
                            </div>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/products?category=${category.name}">${category.name}</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- End Category Module -->

        <!-- Start Latest Product Module -->
        <div class="container-fluid bg-light py-5">
            <div class="row text-center mb-4">
                <p class="fs-4 mb-0">Latest Products</p>
            </div>

            <div class="row row-cols-1 row-cols-md-4 g-4">
                <c:forEach var="product" items="${products}">
                    <div class="col">
                        <div class="card cus-card position-relative">
                            <a href="${pageContext.request.contextPath}/product/${product.id}" style="text-decoration: none;">
                                <div class="position-relative">
                                    <img src="${pageContext.request.contextPath}/img/product_img/${product.image}" class="card-img-top img-fluid" alt="${product.title}">
                                    <c:if test="${product.discount > 0}">
                                        <span class="badge-discount">${product.discount}% off</span>
                                    </c:if>
                                </div>
                                <div class="card-body text-center">
                                    <h5 class="card-title mt-2">${product.title}</h5>
                                    <p class="mb-1">
                                        <span class="real-price">&#8377;${product.discountPrice}</span>
                                        <c:if test="${product.discount > 0}">
                                            <span class="product-price">&#8377;${product.price}</span>
                                        </c:if>
                                    </p>
                                    <a href="${pageContext.request.contextPath}/product/${product.id}" class="btn btn-primary mt-2">View Product</a>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- End Latest Product Module -->

    </section>
    <!-- Promotional Section -->
<div class="promo-section text-center my-4">
    <div class="alert alert-info" role="alert">
        <h4 class="alert-heading">Get 25% Off On Your First Purchase!</h4>
        <p>Shop now for great deals on electronics at RevShop! Discover high-quality products like the latest mobiles, powerful laptops, and advanced TWS buds. Don't miss out on unbeatable prices and exclusive offers!</p>

         <a href="${pageContext.request.contextPath}/products?category=ELECTRONICS" class="btn btn-primary">Shop Now</a>
    </div>
</div>

<section class="reviews my-5">
    <div class="container">
        <h2 class="text-center mb-4">Customer Reviews</h2>
        <div id="reviewsCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="review-text text-center">
                        <p>“Very good quality T-shirts and other products! The materials are top-notch, and the fit is perfect.”</p>
                        <div class="stars">
                            &#9733; &#9733; &#9733; &#9733; &#9734; <!-- 4 out of 5 stars -->
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="review-text text-center">
                        <p>“I absolutely love the electronics section! The laptops are powerful and exactly what I needed for work.”</p>
                        <div class="stars">
                            &#9733; &#9733; &#9733; &#9733; &#9733; <!-- 5 out of 5 stars -->
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="review-text text-center">
                        <p>“Great experience shopping for toys! My kids love their new gadgets, and the prices were unbeatable!”</p>
                        <div class="stars">
                            &#9733; &#9733; &#9733; &#9733; &#9734; <!-- 4 out of 5 stars -->
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="review-text text-center">
                        <p>“Fantastic selection of home appliances! Everything I bought has exceeded my expectations.”</p>
                        <div class="stars">
                            &#9733; &#9733; &#9733; &#9733; &#9733; <!-- 5 out of 5 stars -->
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#reviewsCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#reviewsCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</section>



<footer class="bg-white text-dark py-4">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-3">
                <img src="images/globe-free-img.png" alt="Shipping All Over India" class="mb-2" width="50" height="50">
                <h5>Shipping All Over India</h5>
                <p>Enjoy hassle-free delivery of electronics, fashion, toys, and home appliances right to your doorstep across India.</p>
            </div>
            <div class="col-md-3">
                <img src="images/quality-free-img.png" alt="Best Quality" class="mb-2" width="50" height="50">
                <h5>Best Quality</h5>
                <p>We ensure that every product meets high-quality standards, providing you with reliable and durable options.</p>
            </div>
            <div class="col-md-3">
                <img src="images/tag-free-img.png" alt="Best Offers" class="mb-2" width="50" height="50">
                <h5>Best Offers</h5>
                <p>Shop our exciting deals and discounts on a wide range of products to get the best value for your money.</p>
            </div>
            <div class="col-md-3">
                <img src="images/lock-free-img.png" alt="Secure Payments" class="mb-2" width="50" height="50">
                <h5>Secure Payments</h5>
                <p>Your transactions are safe with us. We offer secure payment options for a worry-free shopping experience.</p>
            </div>
        </div>
        <hr class="my-4" style="border-color: #000000;">
        <div class="row text-center">
            <div class="col-md-6">
                <p class="mb-0">Copyright © 2024 RevShop. Powered by RevShop.</p>
            </div>
            <div class="col-md-6">
                <a href="https://www.facebook.com" target="_blank">
                    <img src="images/download (4).jpeg" alt="Facebook" class="mx-2" width="30" height="30">
                </a>
                <a href="https://www.youtube.com" target="_blank">
                    <img src="images/download (1).png" alt="Twitter" class="mx-2" width="30" height="30">
                </a>
                <a href="https://www.instagram.com" target="_blank">
                    <img src="images/download (5).jpeg" alt="Instagram" class="mx-2" width="30" height="30">
                </a>
                <a href="https://www.google.com" target="_blank">
                    <img src="images/download (2).png" alt="LinkedIn" class="mx-2" width="30" height="30">
                </a>
            </div>
        </div>
    </div>
</footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
