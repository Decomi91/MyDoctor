<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 지도관련 스크립트 -->
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=938fec5f1038f5f89dbb95889b66091b&libraries=services"></script>
 <style type="text/css">
.roding{
 background-image: url("resources/images/ajax-loader.gif"); 
 background-repeat: no-repeat; 
 background-position: center; 

}

    
</style>  

  
<script type="text/javascript">
//테스트 ddd   zxzㅁㄴㅇㅁㄴㅇ
$(function(){  
 
	 function location(lon,lat){
         //지도
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
            level : 4
         };
         var map = new kakao.maps.Map(mapContainer, mapOption);      
         //자신위치 마커
          var imageSrc = 'resources/images/mymarker.png',     
          imageSize = new kakao.maps.Size(64, 69), 
          imageOption = {offset: new kakao.maps.Point(27, 69)};
      
         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
             markerPosition = new kakao.maps.LatLng(lat, lon); 
         var marker = new kakao.maps.Marker({
             position: markerPosition, 
            image: markerImage
            });

         	kakao.maps.event.addListener(map, 'dragend', function() {
  				var level = map.getLevel();
   				var latlng = map.getCenter(); 

   				console.log(latlng.getLng());
   				console.log(latlng.getLat());
   				hs(latlng.getLng(),latlng.getLat());
         	});
         
         
            marker.setMap(map);  
            
            hs(lon, lat);
        
            $("#nearhospital").click(function() {
               $("#map").empty();
               $("#div_result").empty();
             map = new kakao.maps.Map(mapContainer, mapOption);   
             marker.setMap(map);  
               hs(lon, lat);
            });//clcik      
            
            
         
         function hs(xPos, yPos) {
            $.ajax({
                     url : "intro_hs",
                     type : "POST",
                     dataType : "json",
                     //async: false,
                     data : {
                        'xPos' : xPos,
                        'yPos' : yPos
                     },beforeSend:function(){                         
                        $('#roding').addClass('roding');
                        $("#nearpharmacy").prop("disabled", true);
                      },complete:function(){
                         $('#roding').removeClass('roding');
                         $("#nearpharmacy").prop("disabled", false);
                      },success : function(data) {                     
                        var item = data.response.body.items.item;
                        
                        var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                        var imageSize = new kakao.maps.Size(24, 35); 
                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                        
                     
                        
                        
                        
                        function custonSort(a, b) {
                                  if(Number(a.distance) == Number(b.distance)){ return 0} 
                                  return  Number(a.distance) > Number(b.distance) ? 1 : -1;}
                                item.sort(custonSort);
                        
                        
                     
                        
                         
                         var out ="";
                        $.each(item,function(index,items){      
                           var iwContent = '<div style="padding:5px;">'+((index++)+1)+"."+items.yadmNm+'</div>'; 
                            // 마커를 생성합니다
                            var marker = new kakao.maps.Marker({
                                map: map, // 마커를 표시할 지도
                                position: new kakao.maps.LatLng(items.YPos, items.XPos) , // 마커를 표시할 위치
                                title :items.yadmNm, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                image : markerImage, // 마커 이미지                            
                            });
                            
                            
                           
                           
                           out +="<table>";
                           out +="<tr>";
                       
                           out +="<th style='width:70%'><a style='color: black;' href='detail.net?ykiho="+items.ykiho+"&yadmNm="+items.yadmNm+"&clCdNm="+items.clCdNm+"&postNo="+items.postNo+"&addr="+items.addr+"&telno="+items.telno+"&hospUrl="+items.hospUrl+"&estbDd="+items.estbDd+"&drTotCnt="+items.drTotCnt+"&YPos="+items.YPos+"&XPos="+items.XPos+"' id=yadm"+(index+1)+">"+items.yadmNm+"</a></th>";
                           out +="<td>"+items.clCdNm+"</td>";
                           out +="</tr>";
                            
                           out +="<tr>";
                           out +="<td colspan='2'>거리 : "+Math.ceil(items.distance)+"M</td>";
                           out +="</tr>";
                           out +="</table>";
                           
                           $("#div_result").html(out);                           
                            
                            
                            
                            //마우스
                           var iwContent = '<div style="padding:5px;">'+items.yadmNm+'</div>';                        
                            kakao.maps.event.addListener(marker, 'mouseover', function() {                            
                                infowindow.open(map, marker);
                            });
                            
                            kakao.maps.event.addListener(marker, 'mouseout', function() {
                                infowindow.close();
                            });                                                   
                        
                            kakao.maps.event.addListener(marker, 'click', function() {
                               $("a[id=yadm"+(index+1)+"]").focus();
                     
                            });
                            
                       
                            var infowindow = new kakao.maps.InfoWindow({
                               content : iwContent
                           }); 
                           
                           //마우스함수끝
                            

                        });
                     },error : function(data, err) {
                        alert("err")
                     }
                  });//ajax

         }//hs
 
         //엔터키이벤트
         $("#hs_query").keydown(function(key){            
            if(key.keyCode == 13){               
               $('#nearhospital').addClass('primary');
               $('#nearpharmacy').removeClass('primary');
            $.ajax({
                     url : "hs_query",
                     type : "POST",
                     dataType : "json",
                     data : {
                        'xPos' : lon,
                        'yPos' : lat,
                        'cate' : $("#demo-category option:selected").val(),
                        'query': $("#hs_query").val()
                    	 },beforeSend:function(){
                    	 $("#div_result").empty();
                         $('#roding').addClass('roding');
                         $("#nearpharmacy").prop("disabled", true);
                       },complete:function(){
                          $('#roding').removeClass('roding');
                          $("#nearpharmacy").prop("disabled", false);
                       },success : function(data) {
                        var total = data.response.body.totalCount;
                        var item = data.response.body.items.item;
                        var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                        var imageSize = new kakao.maps.Size(24, 35); 
                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                  
                        
                        if(total>1){
                           function custonSort(a, b) {
                                   if(Number(a.distance) == Number(b.distance)){ 
                                   return 0;
                                 }
                                return  Number(a.distance) > Number(b.distance) ? 1 : -1;
                              }
                              item.sort(custonSort);
                           }
                     

                           var out =""   ;
                           if(total==0){
                              $("#map").empty();
                              $("#div_result").empty();
                              var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                               mapOption = { 
                                   center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
                                   level: 3 // 지도의 확대 레벨
                               };
                              map = new kakao.maps.Map(mapContainer, mapOption);
                              out +="<table>";
                                 out +="<tr>";                               
                                 out +="<th>검색결과가 없습니다</th>";
                                 out +="</tr>";
                               
                                 out +="</table>";               
                                 $("#div_result").html(out);
                              
                           }else{
                              $("#map").empty();
                              $("#div_result").empty();
                              var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                               mapOption = { 
                                   center: new kakao.maps.LatLng(item[0].YPos, item[0].XPos), // 지도의 중심좌표
                                   level: 3 // 지도의 확대 레벨
                               };
                              map = new kakao.maps.Map(mapContainer, mapOption);
                              
                           $.each(item,function(index,items){   
                                                         
                               // 마커를 생성합니다
                               var marker = new kakao.maps.Marker({
                                 map: map, // 마커를 표시할 지도
                                   position: new kakao.maps.LatLng(items.YPos, items.XPos) , // 마커를 표시할 위치
                                   title :items.yadmNm, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                   image : markerImage, // 마커 이미지                            
                               });
                     
                              out +="<table>";
                              out +="<tr>";                            
                              out +="<th><a style='color: black;' href='detail.net?ykiho="+items.ykiho+"&yadmNm="+items.yadmNm+"&clCdNm="+items.clCdNm+"&postNo="+items.postNo+"&addr="+items.addr+"&telno="+items.telno+"&hospUrl="+items.hospUrl+"&estbDd="+items.estbDd+"&drTotCnt="+items.drTotCnt+"&YPos="+items.YPos+"&XPos="+items.XPos+"' id=yadm"+(index+1)+">"+items.yadmNm+"</a></th>";
                              out +="<td>"+items.clCdNm+"</td>";
                              out +="</tr>";
                              
                              out +="<tr>";
                              out +="<td colspan='2'>거리 : "+Math.ceil(items.distance)+"M</td>";
                              out +="</tr>";
                               
                              out +="</table>";
                              
                        
                              $("#div_result").html(out);
                               
   
                               //마우스
                              var iwContent = '<div style="padding:5px;">'+items.yadmNm+'</div>';                        
                               kakao.maps.event.addListener(marker, 'mouseover', function() {                            
                                   infowindow.open(map, marker);
                               });                            
                               kakao.maps.event.addListener(marker, 'mouseout', function() {
                                   infowindow.close();
                               });   
                               kakao.maps.event.addListener(marker, 'click', function() {
                                  

                                  $("a[id=yadm"+(index+1)+"]").focus();
                        
                               });
                              
   
                              //마우스끝
                              
                          
                               var infowindow = new kakao.maps.InfoWindow({
                                  content : iwContent
                               }); 
                           });}

                     },error : function(data, err) {
                        alert("결과내용이없음")
                     }
                  });//ajax

      
               
               
            }
            
            
         });
         
         
         //약국
         $("#nearpharmacy").click(function() {
            $("#map").empty();
            $("#div_result").empty();
            
            
            // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
            var infowindow = new kakao.maps.InfoWindow({zIndex:1});
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
                    level: 7 // 지도의 확대 레벨
                };  
            //37.570178
            //126.9809273

            // 지도를 생성   
            var map = new kakao.maps.Map(mapContainer, mapOption); 
            // 장소 검색 객체생성
            var ps = new kakao.maps.services.Places(map); 
            // 카테고리 약국
            ps.categorySearch('PM9', placesSearchCB, {useMapBounds:true}); 

            //data.place_name 이름
            //data.address_name 주소
            //data.place_url 길찾기      
            var out ="";
            
            // 키워드 검색 완료 시 호출되는 콜백함수 입니다
            function placesSearchCB (data, status, pagination) {
               
                if (status === kakao.maps.services.Status.OK) {
                    for (var i=0; i<data.length; i++) {
                        displayMarker(data[i],i);
                        
                        out +="<table>";
                        out +="<tr>";
                        /* out +="<td rowspan ='3' class='table-wrapper'></td>"; */                      
                        out +="<th>"+data[i].place_name+"</th>";
                        out +="<td style='width:70%'><a id = 'place_name"+i+"' href='"+data[i].place_url+"' target='_blank'>상세정보</a></td>";
                        out +="</tr>";
                         
                        out +="<tr>";
                        out +="<td colspan='2'>"+data[i].address_name+"</td>";
                        out +="</tr>";
                         
                        out +="</table>";
                        
                        $("#div_result").html(out);
                    }       
                }
            }

            // 지도에 마커를 표시하는 함수입니다
            function displayMarker(place,i) {
                // 마커를 생성하고 지도에 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: new kakao.maps.LatLng(place.y, place.x) 
                });

                // 마커에 클릭이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', function() {
                   
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                    infowindow.open(map, marker);
                    $("a[id=place_name"+i+"]").focus();
                    
                    
                });
            }            
                           });//pha
      
         
         }

   if(navigator.geolocation){
	   //console.log("뭔데");	
	  	
	   
      navigator.geolocation.getCurrentPosition(onSuccess,onError)//geo funtion
      
      
      
      
   }else{
	alert("뭥미") ;
   }


    function onSuccess(position) {    	  
       var lon = position.coords.longitude, // 경도
       lat = position.coords.latitude; // 위도              
       location(lon,lat);    
    }
    function onError(){
    	var lon = 126.9738851, // 경도
 	   lat = 37.5646291; // 위도                  
 	  	location(lon,lat);  
    }


   
   
 
 
 

});//onload

</script>

</head>
<body class="is-preload">
<%-- <jsp:include page="header.jsp" /> --%>
   <!-- Wrapper -->
   <div id="wrapper">
      <!-- Main -->
      <div id="main">
         <div class="inner">
            <!-- Main -->
<!--             <div id="main"> -->
<!--                <div class="inner"> -->
                  <!-- Header -->
                  <header id="header">
                  
                     <a href="main" class="logo"><strong>My Doctor</strong> by
                        team.5</a>
                  </header>
<!--                </div> -->
<!--             </div> -->
            <!-- Banner: body -->
            <section id="banner">
            
               <table>
               <tbody>               
                  <tr>
                     <td class="content">
                        <div>
                           <button class="nearhospital koreanfont primary" id="nearhospital">주변 병원</button>
                           <button class="nearpharmacy koreanfont" id="nearpharmacy">주변 약국</button><br>
                           <!-- 지도 -->
                           <div id="result">                  
                              <div id='map' style='width: 100%; height: 350px;'></div>
                              <!-- <img src="resources/images/pic10.jpg" alt="" class = "mapsize"/> -->
                           </div>
                        </div>
                     </td>
                     
                     <td class="content" id="roding">
                        <div>
                           <select name="demo-category" id="demo-category" class="categorysel">
                              <option value="">진료과목</option>
                              <option value="01">내과</option>
                              <option value="04">외과</option>
                              <option value="05">정형외과</option>
                              <option value="08">성형외과</option>
                              <option value="10">산부인과</option>
                              <option value="11">소아청소년과</option>
                              <option value="12">안과</option>
                              <option value="13">이비인후과</option>
                              <option value="14">피부과</option>
                              <option value="15">비뇨기과</option>
                              <option value="49">치과</option>                              
                           </select>
                           <section id="search" class="alt hospitalsearch">
                              <input type="text" name="query" id="hs_query" placeholder="병원이름을 입력하세요." />
                           </section>
                           
                           <!-- 병원 list -->
                           <div style="overflow:auto;" class="mapsize" id="div_result">
                           </div>
                        </div>
                     </td>
                  </tr>
                  </tbody>         
               </table>
               
               
            </section>   
            <!-- banner end -->
            
            
         </div>
      </div>
<!-- Sidebar -->
      <jsp:include page="../header/footer.jsp"></jsp:include>
         
      </div>

   <!-- Scripts -->
   

   <script src="resources/js/jquery.min.js"></script>
   <script src="resources/js/browser.min.js"></script>
   <script src="resources/js/breakpoints.min.js"></script>
   <script src="resources/js/util.js"></script>
   <script src="resources/js/main.js"></script>
   <script>
      $("#nearpharmacy").click(function() {
         $("#nearhospital").removeClass('primary');
         $("#nearpharmacy").addClass('primary');
      })
      $("#nearhospital").click(function() {
         $("#nearpharmacy").removeClass('primary');
         $("#nearhospital").addClass('primary');
      })
   </script>
</body>
</html>