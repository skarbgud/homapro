
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>관리자</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<style>
body {
	font-family: '맑은 고딕', verdana;
	padding-bottom: 70px;
	margin: 0;
}

header#header {
	font-size: 20px;
	padding: 5px 0;
}

header#header a {
	color: #000;
	font-weight: bold;
	font-size: 14px;
	text-align: right
}

header#header img {
	width: 40px;
	height: 44px;
	margin-left: 10px;
	margin-bottom: 3px;
}

header#header .title {
	border-bottom: 1px solid gray;
}

#footer {
	background: #f9f9f9;
	padding: 8px;
}

#footer ul li {
	display: inline-block;
	margin-right: 10px;
}
</style>
<!-- 카카오맵 css -->
<style>
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}



.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>

	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>
	<div class="col-md-12">
		<!-- 페이징 -->
		<div class="col-md-3 pull-center">
			<ul class="pagination">
				<c:if test="${listPageMaker.prev}">
					<li><a
						href="list${listPageMaker.makeSearch(listPageMaker.startPage -1)}">[이전]</a></li>
				</c:if>

				<c:forEach begin="${listPageMaker.startPage}"
					end="${listPageMaker.endPage}" var="idx">
					<li><a href="list${listPageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>

				<c:if test="${listPageMaker.next && listPageMaker.endPage>0}">
					<li><a
						href="list${listPageMaker.makeSearch(listPageMaker.endPage + 1)}">[다음]</a></li>
				</c:if>
			</ul>
		</div>
		<!-- 검색 -->
		<div class="col-md-4" style="margin-top: 20px;">
			<div class="input-group">

				<select name="searchType" style="display: none;">
					<option value="a"
						<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>주소</option>
				</select> <input type="text" name="keyword" placeholder="00구,00동으로 검색해주세요."
					id="keywordInput" value="${scri.keyword}" class="form-control" /> <span
					class="input-group-btn">
					<button id="searchBtn" class="btn btn-default" onclick="setBounds()">검색</button>
				</span>
			</div>
		</div>

		<div class="col-md-5 pull-right">
			<a href="/room/regist"><button type="submit"
					class="btn btn-primary btn-lg"
					style="margin-top: 30px; margin-right: 20px; margin-bottom: 10px; float: right;">방등록</button></a>
		</div>
		<script>
			$(function() {
				$('#searchBtn').click(
						function() {
							self.location = "list"
									+ '${listPageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
						});
			});	
		</script>
	</div>
	<div class="col-md-6">
		<c:forEach var="list" items="${list}" varStatus="status">
			<c:if test="${(status.index) % 2 == 0 }">
				<div style="clear: both;"></div>
			</c:if>
			<div style="margin-right: 5px; float: left;">
				<a
					href="/room/read?r_num=${list.r_num}&
											page=${scri.page}&
								perPageNum=${scri.perPageNum}& 
								searchType=${scri.searchType}&
										keyword=${scri.keyword}">
					<img src="${list.r_img}" style="width: 320px; height: 320px;"
					onerror="this.src='../images/none.png';" />
				</a>
				<div style="margin-left: 80px;">${list.r_address1}</div>
			</div>
		</c:forEach>
	</div>



	<div class="col-md-6" id="map" style="height:655px;">       
		<c:forEach var="mapList" items="${mapList}">
		  <input type="hidden" value="${mapList.r_address1}" name="address" class="addr">   
          <input type="hidden" value="${mapList.r_kind}" name="kind" class="kind"><br/>
          <input type="hidden" value="${mapList.r_price}" name="price" class="price"><br/>
          <input type="hidden" value="${mapList.r_area}" name="area" class="area"><br/>
          <input type="hidden" value="${mapList.r_species}" name="species" class="species"><br/>
          <input type="hidden" value="${mapList.r_img}" name="img" class="img"><br/>
          <input type="hidden" value="${mapList.r_available}" name="available" class="available"><br/>
          <input type="hidden" value="${mapList.r_num}" name="num" class="num"><br/>
          <input type="hidden" value="${scri.page}" name="page" class="page"><br/>
          <input type="hidden" value="${scri.perPageNum}" name="perPageNum" class="perPageNum"><br/>
          <input type="hidden" value="${scri.searchType}" name="searchType" class="searchType"><br/>
          <input type="hidden" value="${scri.keyword}" name="keyword" class="keyword"><br/>
		</c:forEach>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24cb38fdf6754a74592c8ec4b53a52c9&libraries=services,clusterer,drawing"></script>
      <script type="text/javascript">

         var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
         var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(37.5666805, 126.9784147), //지도의 중심좌표.
            level: 6 //지도의 레벨(확대, 축소 정도) 
         };
         var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
         // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
         var mapTypeControl = new kakao.maps.MapTypeControl();

         // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
         // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
         map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

         // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
         var zoomControl = new kakao.maps.ZoomControl();
         map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      
         let addressArray = [];
         var addrlist = $('.addr');
      	
         
         
      
         
         for (var i = 0; i < addrlist.length; i++) {
            addressArray.push({
               'groupAddress' : $("input[name='address']").eq(i).val(),                     
               'groupKind' : $("input[name='kind']").eq(i).val(),
               'groupPrice' : $("input[name='price']").eq(i).val(),            
               'groupArea' : $("input[name='area']").eq(i).val(),            
               'groupSpecies' : $("input[name='species']").eq(i).val(),
               'groupImg' : $("input[name='img']").eq(i).val(),
               'groupGender' : $("input[name='available']").eq(i).val(),
               'groupNum' : $("input[name='num']").eq(i).val(),
               'groupKeyword' : $("input[name='keyword']").eq(i).val(),
               'groupSearchType' : $("input[name='searchType']").eq(i).val()
            });
         }
         
         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new kakao.maps.services.Geocoder();
      	// 주소로 좌표를 검색합니다
         geocoder.addressSearch(document.getElementById('keywordInput').value, function(result, status) {
             // 정상적으로 검색이 완료됐으면 
              if (status === kakao.maps.services.Status.OK) {

                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
                 map.setCenter(coords);
             } 
         });    
         
         
         
         
         
         
         
         
         
         for (var i = 0; i < addressArray.length; i++) {
            let content = '<div class="wrap" >' +
               '    <div class="info">' + 
               '        <div class="title">' + 
                           addressArray[i].groupAddress+ 
               '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
               '        </div>' + 
               '<a href="/room/read?r_num='+addressArray[i].groupNum+'&page='+${scri.page}+'&perPageNum='+${scri.perPageNum}+'&searchType='+addressArray[i].groupSearchType+'&keyword='+addressArray[i].groupKeyword+'"> <div class="body">' +
               
               '            <div class="img">' +
               '                <img src='+addressArray[i].groupImg+' width="73" height="70">' +
               '           </div>' + 
               '            <div class="desc">' + 
               '                <div class="ellipsis">'+addressArray[i].groupKind+'</div>' + 
               '                <div>가격:'+addressArray[i].groupPrice+'만원'+'('+addressArray[i].groupArea+'m²)'+addressArray[i].groupSpecies+'</div>' + 
             '                <div class="jibun ellipsis">원하는 성별 :'+addressArray[i].groupGender+'</div>' + 
               '            </div>' + 
               '        </div></a>' + 
               '    </div>' + 
               '</div>';
         
             
               
            geocoder.addressSearch(
                  addressArray[i].groupAddress,
                  function(result, status, data) {
                     // 정상적으로 검색이 완료됐으면 
                       if (status === kakao.maps.services.Status.OK) {
                        
                         //마커를 표시할 위치
                          var position = new kakao.maps.LatLng(result[0].y, result[0].x);
                        
                          var marker = new kakao.maps.Marker({
                             map: map,
                              position: position
                          });
                  
                         
                         var overlay = new kakao.maps.CustomOverlay({
                             content: content,
                             position:marker.getPosition()   
                         });
                      // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                         kakao.maps.event.addListener(marker, 'click', function() {
                             overlay.setMap(map);
                         });

                          
                        function closeOverlay() { 
                            overlay.setMap(null);     
                        } 
                        
                     }
                  });
         }
      </script>


</body>
</html>