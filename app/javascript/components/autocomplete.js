function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var searchAddress = document.getElementById('search');

    if (searchAddress) {
      var autocomplete = new google.maps.places.Autocomplete(searchAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(searchAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
