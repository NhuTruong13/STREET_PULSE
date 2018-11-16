import GMaps from 'gmaps/gmaps.js';

import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');
if (mapElement) {
  const map = new GMaps({ el: '#map', lat: 0, lng: 0});
  const markers = JSON.parse(mapElement.dataset.marker);
  console.log(markers.length); // don't try to build a map if there's no div#map to inject in
  const marker_main = markers.shift();
  // add markers (reviews in the radius)
  map.addMarkers(markers);
  // add the main marker (user typed address)
  map.addMarker({
   lat: marker_main,
   lng: marker_main,
   icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
   animation: google.maps.Animation.DROP,
  });
  markers.unshift(marker_main);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(marker_main.lat, marker_main.lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

autocomplete();


// polygon = map.drawPolygon({
//   paths: path, // pre-defined polygon shape
//   strokeColor: '#BBD8E9',
//   strokeOpacity: 1,
//   strokeWeight: 3,
//   fillColor: '#BBD8E9',
//   fillOpacity: 0.6
// });
