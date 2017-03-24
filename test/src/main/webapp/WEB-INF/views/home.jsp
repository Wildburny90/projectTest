<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApHkc_70xfMcN5SF0_8T6uNpspm-GXyDo&callback=initialize&libraries=places"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <style>
        html, body { height: 100%; margin: 0; padding: 0; }
        #pac-input {
            background-color: #fff;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            margin-left: 12px;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 300px;
        }
    </style>
</head>
<body>
<input id="pac-input" class="controls" type="text" placeholder="Search Box">
<div id="map_canvas"style="float:left;width:60%;height:100%"></div>
<div id="map_side"style="float:left;width:40%;height:100%">
    Lat: <input type="text" id="lat"><br>
    Lng: <input type="text" id="lng"><br>
    장소ID: <input type="text" id="placeID">
    <input type="button" id="deleteMarkers" value="마커초기화" onclick="javascript:deleteMarkers()">
    <a href="boardWrite">글쓰기</a>
    <%--<jsp:include page="boardWrite.jsp" flush="false">--%>
        <%--<jsp:param name="lat" value=""></jsp:param>--%>
        <%--<jsp:param name="lng" value=""></jsp:param>--%>
    <%--</jsp:include>--%>
</div>
<script>
    var markers = [];
    function initialize() {
        var geocoder = new google.maps.Geocoder;
        var infowindow = new google.maps.InfoWindow();
        var myLatlng = new google.maps.LatLng(37.51081519807654,127.06040382385254);
        var myOptions = {
            zoom: 15,
            center: myLatlng
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

        map.addListener('click',function(event) {
            console.log(event);
            addMarker(event.latLng, 'Click Generated Marker', map);
            $('#lat').val(event.latLng.lat())  ;
            $('#lng').val(event.latLng.lng())  ;
        });

        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        map.addListener('bounds_changed', function() {
            searchBox.setBounds(map.getBounds());
        });

        searchBox.addListener('places_changed', function() {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }

            // Clear out the old markers.
            markers.forEach(function(marker) {
                marker.setMap(null);
            });
            markers = [];

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function(place) {
                // Create a marker for each place.
                var marker_searched = new google.maps.Marker({
                    map: map,
                    title: place.name,
                    position: place.geometry.location,
                    animation: google.maps.Animation.DROP
                });
                console.log(place);
                marker_searched.setPlace({
                    placeId: place.place_id,
                    location: place.geometry.location
                });
                marker_searched.addListener('click',function(event) {
                    function toggleBounce() {
                        if (marker_searched.getAnimation() !== null) {
                            marker_searched.setAnimation(null);
                        } else {
                            marker_searched.setAnimation(google.maps.Animation.BOUNCE);
                        }
                    }
                    $('#lat').val(event.latLng.lat())  ;
                    $('#lng').val(event.latLng.lng())  ;
                    toggleBounce();
                    var latitude=event.latLng.lat();
                    var longitude=event.latLng.lng();
                    var latlng = {lat: latitude, lng: longitude};

                geocoder.geocode({'location': latlng}, function(results, status) {
                        console.log(results);
                        if (status === google.maps.GeocoderStatus.OK) {
                            if (results[1]) {
                                $('#placeID').val(results[0].place_id);
                            } else {
                                window.alert('No results found');
                            }
                        } else {
                            window.alert('Geocoder failed due to: ' + status);
                        }
                    });
                    infowindow.setContent(place.name);
                    infowindow.open(map, marker_searched);
                });
                markers.push(marker_searched);

                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            map.fitBounds(bounds);
        });
    }


    function addMarker(latlng,title,map) {
        var service =  new google.maps.places.PlacesService(map);
        var geocoder = new google.maps.Geocoder;
        var infowindow = new google.maps.InfoWindow();
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
            var latitude=event.latLng.lat();
            var longitude=event.latLng.lng();
            var latlng = {lat: latitude, lng: longitude};
            $.ajax({
                url: 'boardWrite',
                type: 'GET',
                data: latlng,
                success: function (data) {
                    $('#map_side').html(data);
                }
            });
            geocoder.geocode({'location': latlng}, function(results, status) {
                console.log(results);
                if (status === google.maps.GeocoderStatus.OK) {

                    $('#placeID').val(results[1].place_id);
                    service.getDetails({
                        placeId: results[1].place_id
                    }, function (place, status) {
                        console.log(status);
                        if (status === google.maps.places.PlacesServiceStatus.OK) {
                            infowindow.setContent(place.name);
                        } else {
                            console.log('장소이름가져오기실패');
                        }
                    })

                } else {
                    window.alert('Geocoder failed due to: ' + status);
                }
            });
            infowindow.open(map, marker);
        });

        markers.push(marker);
        console.log(markers);
    }

    function deleteMarkers() {
        markers.forEach(function (marker) {
            marker.setMap(null);
        });
        markers = [];
    }

</script>
</body>
</html>