const infowindow;

// // TODO: Replace coordinates with the ones of the search
// function initMap() {
//   const pyrmont = {
//     lat: 50.8455,
//     lng: 4.3575
//   };

//   map = new google.maps.Map(document.getElementById('map'), {
//     center: pyrmont,
//     // TODO: the zoom must be dependant of the radius ?
//     zoom: 15
//   });

//   infowindow = new google.maps.InfoWindow();
  // const service = new google.maps.places.PlacesService(mapElement);
  // queries.forEach((query) => {
  //   service.nearbySearch({
  //     location: marker_main,
  //     radius: radius,
  //     type: ['${query}']
  //   }, callback);
// }

// function callback(results, status) {
//   if (status === google.maps.places.PlacesServiceStatus.OK) {
//     for (const i = 0; i < results.length; i++) {
//       createMarker(results[i]);
//     }
//   }
// }


// function createMarker(place) {
//   const placeLoc = place.geometry.location;
//   const marker = new google.maps.Marker({
//     map: map,
//     position: place.geometry.location
//   });

//   // TODO: Enhance the information displayed when marker clicked
//   google.maps.event.addListener(marker, 'click', function() {
//     infowindow.setContent(place.name);
//     infowindow.open(map, this);
//   });
// }


