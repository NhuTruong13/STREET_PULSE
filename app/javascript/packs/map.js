import GMaps from 'gmaps/gmaps.js';
import $ from 'jquery';
import "bootstrap";

import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');

if (mapElement) {
  const map = new GMaps({ el: '#map', lat: 0, lng: 0});
  const markers = JSON.parse(mapElement.dataset.marker);
  const marker_main = markers.shift();
  const radius = parseInt(mapElement.dataset.radius);

  const circle = map.drawCircle({
    lat: marker_main,
    lng: marker_main,
    radius: radius,
    fillColor: 'yellow',
    fillOpacity: 0.3,
    strokeWeight: 0.3,
    strokeColor: 'black',
    strokeOpacity: 0.5,
  });

  // add markers in one go (reviews in the radius):
  console.log(markers);

  // map.addMarkers(markers);
  // need to set markers one by one? to be able to assign "click"
  // and also assign review_id to each marker
  markers.forEach(addOneMarker);

  function addOneMarker(item) {
    map.addMarker({
      lat: item.lat,
      lng: item.lng,
      title: item.title,
      review_id: item.review_id,
      animation: google.maps.Animation.DROP,
      click: function(){
        $(`#reviewModal-${item.review_id}`).modal();
      }
    });
  };

  // add the main marker (user typed address)
  map.addMarker({
    lat: marker_main,
    lng: marker_main,
    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
  });

  markers.unshift(marker_main);

  // set zoom
  if (markers.length === 1) {
    map.setCenter(marker_main.lat, marker_main.lng);
    map.fitBounds(circle.getBounds());
  }
  else {
    // 2 possible zoom versions:
    map.fitLatLngBounds(markers);
    // map.fitBounds(circle.getBounds());
    // map.setCenter(marker_main.lat, marker_main.lng);
  }

}

autocomplete();

