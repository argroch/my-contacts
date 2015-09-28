$(document).ready(function (){

	var myCoords = new google.maps.LatLng(latitude,longitude);

  function initialize() {
    var mapOptions = {
    center: myCoords,
    zoom: 12,
    scrollwheel: false
    };
      
    var map = new google.maps.Map(document.getElementById('contact-map'), mapOptions);


    var infowindow = new google.maps.InfoWindow({
 			content: "<h5>" + name + "</h5><p>" + address + "</p>"
			});

    var marker = new google.maps.Marker({
		  position: myCoords,
		  map: map,
		  title: address,
		  animation: google.maps.Animation.DROP
		});

		google.maps.event.addListener(marker, 'click', function() {
  		infowindow.open(map,marker);
  	});

  }
 	google.maps.event.addDomListener(window, 'load', initialize);
});

