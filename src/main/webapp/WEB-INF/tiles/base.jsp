<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="${cp }/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${cp }/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${cp }/gentelella/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${cp }/gentelella/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="${cp }/gentelella/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="${cp }/gentelella/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${cp }/gentelella/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${cp }/gentelella/build/css/custom.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="${cp }/gentelella/vendors/jquery/dist/jquery.min.js"></script>
    
    <!-- moment -->
    <script src="${cp }/js/moment.min.js"></script>
  
    <!-- sweetalert2 -->
    <link href="${cp }/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="${cp }/sweetalert2/dist/sweetalert2.min.js"></script>
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- left -->
        <tiles:insertAttribute name="left"/>
        
		<!-- top -->
		<tiles:insertAttribute name="top"/>

		<!-- content -->
		<tiles:insertAttribute name="content"/>
		
		<!-- footer -->
		<tiles:insertAttribute name="footer"/>
      </div>
    </div>

    <!-- Bootstrap -->
    <script src="${cp }/gentelella/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="${cp }/gentelella/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${cp }/gentelella/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="${cp }/gentelella/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="${cp }/gentelella/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${cp }/gentelella/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="${cp }/gentelella/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="${cp }/gentelella/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="${cp }/gentelella/vendors/Flot/jquery.flot.js"></script>
    <script src="${cp }/gentelella/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="${cp }/gentelella/vendors/Flot/jquery.flot.time.js"></script>
    <script src="${cp }/gentelella/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="${cp }/gentelella/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="${cp }/gentelella/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="${cp }/gentelella/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="${cp }/gentelella/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="${cp }/gentelella/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="${cp }/gentelella/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="${cp }/gentelella/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="${cp }/gentelella/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${cp }/gentelella/vendors/moment/min/moment.min.js"></script>
    <script src="${cp }/gentelella/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${cp }/gentelella/build/js/custom.min.js"></script>
	
  </body>
</html>
    