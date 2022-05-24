$(document).on('turbolinks:load', function () {
  let mapOptions = {
    zoom: 10,
    center: new google.maps.LatLng(10.820303, 106.597862),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  function mapMarkers(mapOptions, address) {
    let map = new google.maps.Map(document.getElementById('map'), mapOptions);
    litsener(map, address)
  };

  function litsener(map, address) {
    google.maps.event.addListener(map, 'click', function (event) {
      let marker = new google.maps.Marker({
        position: event.latLng,
        map: map
      });
      let position = [event.latLng.lat(), event.latLng.lng()];
      let url = '';
      if (address[0].id == 'client_address') {
        url = '/show-address-client';
      } else {
        url = '/show-address-emp';
      }
      $.ajax({
        url: url,
        type: 'POST',
        dataType: 'json',
        data: { position: position },
        success: function (data) {
          address.val(data.html[0].data.display_name);
          return true;
        },
      });
    });
  }

  let addressEmployee = $('#employee_current_address');
  let clientAddress = $('#client_address');
  mapMarkers(mapOptions, addressEmployee);
  mapMarkers(mapOptions, clientAddress);

  $(document).on('click', '#show-location-emp, #show-location-client', function () {
    let address = '';
    let url = '';
    let addrListener = '';
    if (this.id == 'show-location-emp') {
      address = $('#employee_current_address').val();
      url = '/handler-address-emp';
      addrListener = $('#employee_current_address');
    } else {
      address = $('#client_address').val();
      url = '/handler-address-client';
      addrListener = $('#client_address');
    }
    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json',
      data: { address: address },
      success: function (data) {
        let handler = Gmaps.build('Google');
        let map = handler.buildMap({ provider: {}, internal: { id: 'map' } }, function () {
          markers = handler.addMarkers([{ "lat": data.html[0].data.lat, "lng": data.html[0].data.lon, "infowindow": "Your Address" }]);
          handler.bounds.extendWith(markers);
          handler.fitMapToBounds();
          handler.getMap().setZoom(12);
        });
        map = map.serviceObject
        litsener(map, addrListener);
        return true;
      },
    });
  });
});
