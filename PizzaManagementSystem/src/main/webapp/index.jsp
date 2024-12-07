<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
  
    <title>Pizza</title>
    <meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
     
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/open-iconic-bootstrap.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/owl.carousel.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/owl.theme.default.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/magnific-popup.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/ionicons.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/aos.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/bootstrap-datepicker.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/jquery.timepicker.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/flaticon.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/icomoon.css">
     
  </head>
  <body>
  	<nav style="background-image: url(css/images/nav_bg.jpg); background-size: cover; background-position: center; padding: 1rem 0; font-family: 'Arial', sans-serif; class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto" style="font-size: 2.2rem;">
                <li class="nav-item active"><a href="" class="nav-link" style="font-size: 1.2rem;"> <b>Home</b></a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/login" class="nav-link" style="font-size: 1.2rem;"><b>Admin Portal</b></a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/userlogin" class="nav-link" style="font-size: 1.2rem;"><b>User Login</b></a></li>
            </ul>
        </div>
    </div>
</nav>
    <!-- END nav -->

    <section class="home-slider owl-carousel img" style="background-image: url(css/images/bg_main3.jpg); background-repeat: no-repeat; background-size: cover;">
      <div class="slider-item"  style="width: 900px; height: 600px;">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center" data-scrollax-parent="true">

            <div class="col-md-6 col-sm-12 ftco-animate">
            	<span class="subheading" style="color: white;">Delicious</span>
              <h1 class="mb-4" style="color: white;">Italian Cuizine</h1>
              <p class="mb-4 mb-md-5" style="color: white;">Our crusts are meticulously crafted to deliver a delightful combination of crunch and chew, ensuring that every bite is a satisfying experience.</p>
              
            </div>
            <div class="col-md-6 ftco-animate">
            	<img src="${pageContext.request.contextPath}" class="img-fluid" alt="">
            </div>

          </div>
        </div>
      </div>

      <div class="slider-item">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center" data-scrollax-parent="true">

            <div class="col-md-6 col-sm-12 order-md-last ftco-animate" style="color: white;">
            	<b><span class="subheading">Crunchy</span></b>
              <b><h1 class="mb-4" style="color: white;">Wide Pizza Variety</h1></b>
              <p class="mb-4 mb-md-5" style="color: white;"><b> Pair our crust with a variety of mouthwatering toppings and sauces, and you have a pizza that is not only delicious but also delightfully crunchy.</b></p>
             
            </div>
            <div class="col-md-6 ftco-animate">
            	<img src="${pageContext.request.contextPath}" class="img-fluid" alt="">
            </div>

          </div>
        </div>
      </div>

      <div class="slider-item" style="background-image: url(;">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-md-7 col-sm-12 text-center ftco-animate" style="color: white;">
            	<span class="subheading">Welcome</span>
              <h1 class="mb-4" style="color: white;">We cooked your desired Pizza Recipe</h1>
              <p class="mb-4 mb-md-5" style="color: white;">Explore a variety of unique and traditional pizza flavors that you won't find anywhere else.</p>
              </b>
            </div>

          </div>
        </div>
      </div>
    </section>

    <section class="ftco-about d-md-flex" style="display: flex; flex-wrap: wrap; align-items: center; padding: 2rem; background-color: #f9f9f9; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
    <div class="one-half img" style="flex: 1; min-width: 300px; background-image: url(css/images/about.jpg); background-size: cover; background-position: center; height: 400px; border-radius: 10px 0 0 10px;"></div>
    <div class="one-half ftco-animate" style="flex: 1; min-width: 300px; padding: 2rem; background-color: #fff; border-radius: 0 10px 10px 0;">
        <div class="heading-section ftco-animate" style="margin-bottom: 1.5rem;">
            <h2 class="mb-4" style="font-size: 2.5rem; color: #333; font-weight: 700;">Welcome to <span class="flaticon-pizza" style="color: #ff6347;">Pizza</span> A Restaurant</h2>
        </div>
        <div>
            <p style="font-size: 1.1rem; line-height: 1.6; color: #666;">Welcome to Pizza Paradise, where every slice is a celebration of flavor and tradition. Nestled in the heart of the city, our restaurant is a haven for pizza lovers seeking an unforgettable dining experience. Step inside and be greeted by the inviting aroma of freshly baked dough and the tantalizing scent of our signature sauces. Our cozy and stylish ambiance sets the perfect stage for a memorable meal with family and friends. At Pizza Paradise, we pride ourselves on using only the finest ingredients, sourced locally whenever possible, to ensure that every bite is bursting with freshness and flavor. Whether you're joining us for a quick lunch, a leisurely dinner, or a special occasion, our attentive staff is dedicated to making your visit enjoyable and stress-free. Explore our diverse menu, featuring a variety of classic and innovative pizzas, as well as delicious sides and desserts. We look forward to serving you and making your time with us truly special.

</p>
        </div>
    </div>
</section>

    <section class="ftco-section ftco-services">
    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h2 class="mb-4">Our Services</h2>
            <p>At Pizza Paradise, we pride ourselves on offering a variety of services that cater to your cravings and lifestyle. Whether you're looking for nutritious options, speedy delivery, or authentic recipes, we've got you covered.</p>
          </div>
        </div>
    		<div class="row">
          <div class="col-md-4 ftco-animate">
            <div class="media d-block text-center block-6 services">
              <div class="icon d-flex justify-content-center align-items-center mb-5">
              	<span class="flaticon-diet"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Healthy Foods</h3>
                <p>Our menu features a range of healthy options, including whole grain crusts, vegetarian and vegan pizzas, low-calorie options, and gluten-free pizzas.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-4 ftco-animate">
            <div class="media d-block text-center block-6 services">
              <div class="icon d-flex justify-content-center align-items-center mb-5">
              	<span class="flaticon-bicycle"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Fastest Delivery</h3>
                <p>We understand that sometimes you just can't wait to satisfy your pizza cravings. That's why we offer express delivery, real-time tracking, wide coverage area, and contactless delivery options for your peace of mind.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-4 ftco-animate">
            <div class="media d-block text-center block-6 services">
              <div class="icon d-flex justify-content-center align-items-center mb-5"><span class="flaticon-pizza-1"></span></div>
              <div class="media-body">
                <h3 class="heading">Original Recipes</h3>
                <p>Our pizzas are crafted with love and care, using original recipes passed down through generations. Each pizza is handmade with care, ensuring the perfect texture and taste.</p>
              </div>
            </div>    
          </div>
        </div>
    	</div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h3 class="mb-4" >Quality Pizza Meals</h3>
            <p>We use only the freshest and highest quality ingredients, and you can explore a variety of unique and traditional pizza flavors that you won't find anywhere else.</p>
          </div>
        </div>
    	</div>
    	
    <section class="ftco-gallery">
    	<div class="container-wrap">
    		<div class="row no-gutters">
					<div class="col-md-3 ftco-animate">
						<a href="&#35" class="gallery img d-flex align-items-center" style="background-image: url(css/images/gallery-1.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="&#35" class="gallery img d-flex align-items-center" style="background-image: url(css/images/gallery-2.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="&#35" class="gallery img d-flex align-items-center" style="background-image: url(css/images/gallery-3.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="&#35" class="gallery img d-flex align-items-center" style="background-image: url(css/images/gallery-4.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    					</div>
						</a>
					</div>
        </div>
    	</div>
    </section>


		<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(css/images/bg_2.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
        	<div class="col-md-10">
        		<div class="row" >
        		<div style="width: 100px; height: 600px; background-color: #F5F5F5;">
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate" >
		            <div class="block-18 text-center">
		              <div class="text">
		              	<div class="icon"><span class="flaticon-pizza-1"></span></div>
		              	<strong class="number" data-number="100">0</strong>
		              	 
		              	<span>Pizza Branches</span>
		              </div>
		            </div>
		          </div> <br><br><br>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<div class="icon"><span class="flaticon-medal"></span></div>
		              	<strong class="number" data-number="85">0</strong>
		              	<span>Number of Awards</span>
		              </div>
		            </div>
		          </div><br><br><br>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<div class="icon"><span class="flaticon-laugh"></span></div>
		              	<strong class="number" data-number="10567">0</strong>
		              	<span>Happy Customer</span>
		              </div>
		            </div>
		          </div><br><br><br>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<div class="icon"><span class="flaticon-chef"></span></div>
		              	<strong class="number" data-number="900">0</strong>
		              	<span>Staff</span>
		              	</div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
        </div>
      </div>
    </section>

    <footer class="ftco-footer ftco-section img" href="#123">
    	<div class="overlay"></div>
      <div class="container">
        <div class="row mb-5">
          <div class="col-lg-3 col-md-6 mb-5 mb-md-5">
          
          </div>
          
          
          <div class="col-lg-3 col-md-6 mb-5 mb-md-5">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul style="list-style: none;">
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          
        </div>
      </div>
    </footer>
    
  

  
  <script src="${pageContext.request.contextPath}/css/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/css/js/scrollax.min.js"></script>
    
  <script src="${pageContext.request.contextPath}/css/js/main.js"></script>
    
  </body>
</html>