$(document).ready(function(){
   $('#contact-page').each(function(){
       var lat=49.525727;
       var lng=23.971975;

       var myLatlng = new google.maps.LatLng(lat, lng);
       var myOptions = {
           zoom: 15,
           center: myLatlng,
           mapTypeId: google.maps.MapTypeId.ROADMAP
       };
       var map = new google.maps.Map(document.getElementById("gmap"), myOptions);

       var marker = new google.maps.Marker({
           position: myLatlng,
           map: map,
           title:"Гуртівня будівельних товарів \"Десятка\""
       });

       $(window).resize(function(){
           var h=window.innerHeight;
           $('#map-wrapper').css('max-height',h);
           console.log('h:'+h);
       });
   });
});