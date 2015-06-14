/**
 * Created by mackenziesampson1 on 15-06-13.
 */
/**
 * @fileoverview Sample showing capturing a KML file click
 *   and displaying the contents in a side panel instead of
 *   an InfoWindow
 */

var map;
var src = 'https://developers.google.com/maps/tutorials/kml/westcampus.kml';

/**
 * Initializes the map and calls the function that creates polylines.
 */
function initialize() {
    map = new google.maps.Map(document.getElementById('map-canvas'), {
        center: new google.maps.LatLng(-19.257753, 146.823688),
        zoom: 2,
        mapTypeId: google.maps.MapTypeId.TERRAIN
    });
    loadKmlLayer(src, map);
}

/**
 * Adds a KMLLayer based on the URL passed. Clicking on a marker
 * results in the balloon content being loaded into the right-hand div.
 * @param {string} src A URL for a KML file.
 */
function loadKmlLayer(src, map) {
    var kmlLayer = new google.maps.KmlLayer(src, {
        suppressInfoWindows: true,
        preserveViewport: false,
        map: map
    });
    google.maps.event.addListener(kmlLayer, 'click', function(event) {
        var content = event.featureData.infoWindowHtml;
        var testimonial = document.getElementById('capture');
        testimonial.innerHTML = content;
    });
}

google.maps.event.addDomListener(window, 'load', initialize);

function initialize() {
    var mapCanvas = document.getElementById('map-canvas');
    var mapOptions = {
        center: new google.maps.LatLng(49.254132, -123.135243),
        zoom: 12,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(mapCanvas, mapOptions)
}
google.maps.event.addDomListener(window, 'load', initialize);