<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>STUDY_BOARD</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${cp }/Flattern/assets/img/favicon.png" rel="icon">
  <link href="${cp }/Flattern/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Muli:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${cp }/Flattern/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${cp }/Flattern/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${cp }/Flattern/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${cp }/Flattern/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${cp }/Flattern/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="${cp }/Flattern/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${cp }/Flattern/assets/vendor/aos/aos.css" rel="stylesheet">
  
  <!-- fontawesome 5.13.0 -->
  <link href="${cp }/fontawesome-free-5.13.0-web/css/all.min.css" rel="stylesheet">
  
  <!-- Board CSS -->
  <link href="${cp }/css/board.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${cp }/Flattern/assets/css/style.css" rel="stylesheet">

  <!-- jQuery -->
  <script src="${cp }/js/jquery-3.4.1.min.js"></script>
  
  <!-- moment -->
  <script src="${cp }/js/moment.min.js"></script>
  
  <!-- sweetalert2 -->
  <link href="${cp }/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
  <script src="${cp }/sweetalert2/dist/sweetalert2.min.js"></script>
  
  <!-- =======================================================
  * Template Name: Flattern - v2.0.0
  * Template URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Top Bar ======= -->
<section id="topbar" class="d-none d-lg-block">
	<tiles:insertAttribute name="topbar"/>
</section>

  <!-- ======= Header ======= -->
  <header id="header">
	<tiles:insertAttribute name="header"/>
  </header><!-- End Header -->
  
  <!-- ======= Hero ======= -->
  <section id="hero" style="display: none;"> <!-- 막아둠 -->
    <tiles:insertAttribute name="hero"/>
  </section>
  
  <!-- ======= Content ======= -->
  <tiles:insertAttribute name="content"/>
	
  <!-- ======= Footer ======= -->
  <footer id="footer">
	<tiles:insertAttribute name="footer"/>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="${cp }/Flattern/assets/vendor/jquery/jquery.min.js"></script>
  <script src="${cp }/Flattern/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${cp }/Flattern/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${cp }/Flattern/assets/vendor/php-email-form/validate.js"></script>
  <script src="${cp }/Flattern/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
  <script src="${cp }/Flattern/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${cp }/Flattern/assets/vendor/venobox/venobox.min.js"></script>
  <script src="${cp }/Flattern/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="${cp }/Flattern/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${cp }/Flattern/assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="${cp }/Flattern/assets/js/main.js"></script>
  
</body>

</html>