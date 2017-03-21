<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApHkc_70xfMcN5SF0_8T6uNpspm-GXyDo&callback=initialize"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <style>
        html, body { height: 100%; margin: 0; padding: 0; }
    </style>
</head>
<body>
<div id="map_canvas"style="float:left;width:60%;height:100%"></div>
<div id="map_side"style="float:left;width:40%;height:100%">
    Lat: <input type="text" id="lat"><br>
    Lng: <input type="text" id="lng">
</div>
<script>
    function initialize() {
        var myLatlng = new google.maps.LatLng(37.51081519807654,127.06040382385254);
        var myOptions = {
            zoom: 15,
            center: myLatlng
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

        map.addListener('click',function(event) {
            addMarker(event.latLng, 'Click Generated Marker', map);
                    });
        map.addListener('click',function (event) {
            $('#lat').val(event.latLng.lat())  ;
            $('#lng').val(event.latLng.lng())  ;
        });
    }


    function addMarker(latlng,title,map) {

        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: title,
            animation: google.maps.Animation.DROP,
            draggable:true
        });

        function toggleBounce() {
            if (marker.getAnimation() !== null) {
                marker.setAnimation(null);
            } else {
                marker.setAnimation(google.maps.Animation.BOUNCE);
            }
        }

        marker.addListener('drag',function(event) {
            $('#lat').val(event.latLng.lat())  ;
            $('#lng').val(event.latLng.lng())  ;
        });
        marker.addListener('dragend',function(event) {
            $('#lat').val(event.latLng.lat())  ;
            $('#lng').val(event.latLng.lng())  ;
        });
        marker.addListener('click',function(event) {
            $('#lat').val(event.latLng.lat())  ;
            $('#lng').val(event.latLng.lng())  ;
            toggleBounce();
        });
    }

</script>
</body>
</html>