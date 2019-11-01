<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
img {
	width: auto;
	height: 60px;
	border: 5px solid black;
}
</style>

<head>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../assets/images/favicon.png">
<title>Connected Car Control System - Team 1</title>

<!-- Custom CSS -->
<link href="assets/libs/flot/css/float-chart.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="dist/css/style.min.css" rel="stylesheet">
<!-- T-map -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&format=javascript&appkey=dbd0828d-01af-45cb-956b-a170291f8d2b"></script>

<script type="text/javascript">
	var map;
	var lonlat;
	var label;

	function initTmap() {
		map = new Tmapv2.Map("map_div", {
			center : new Tmapv2.LatLng(37.566481622437934, 126.98502302169841),
			width : "100%",
			height : "400px",
			zomm : 15
		});
	}

	function Move(car_lat, car_log) {
		var lonlat = new Tmapv2.LatLng(car_lat, car_log);
		map.setCenter(lonlat);
	}

	//make marker
	function MakeMarker(car_id, car_lat, car_log) {
		var lonlat = new Tmapv2.LatLng(car_lat, car_log);
		var title = car_id;

		label = "<span style='background-color: #46414E;color:white'>" + title
				+ "</span>";

		marker = new Tmapv2.Marker({
			position : lonlat,
			map : map,
			title : title,
			label : label
		});
	}

	$(document).ready(function(){
		initTmap();

		<c:forEach var="car" items="${admincars}">
		MakeMarker('${car.car_id}', '${car.car_lat}', '${car.car_log}');
		
		$('#targetCar${car.car_id}').click(function() {
			Move('${car.car_lat}','${car.car_log}');
		});
		</c:forEach>	
	});
</script>

</head>
<!-- ============================================================== -->
<!-- Container fluid  -->
<!-- ============================================================== -->
<div class="container-fluid">
	<!-- ============================================================== -->
	<!-- Sales Cards  -->
	<!-- ============================================================== -->
	<div class="row el-element-overlay">
		<div class="col-12">
			<div class="card">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="admincarlist.mc">관리자모드
								차량조회</a></li>
						<li class="breadcrumb-item"><a href="adminuserlist.mc">관리자모드
								유저관리</a></li>
					</ol>
				</nav>

				<div class="card">
					<!-- T-map Initialization -->
					<div id="map_div"></div>
				</div>


				<div class="card">
					<div class="card-body">
						<h5 class="card-title">차량 목록</h5>
						<div class="row">
							<c:forEach var="car" items="${admincars}">
								<div class="col-md-3 col-sm-6">
									<button id="targetCar${car.car_id }"
										class="btn btn-lg btn-block btn-outline-info">${car.car_id}</button>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- Recent comment and chats -->
		<!-- ============================================================== -->
	</div>
</div>
<!-- ============================================================== -->
<!-- End Container fluid  -->
<!-- ============================================================== -->