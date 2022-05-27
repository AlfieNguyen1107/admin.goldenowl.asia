$(document).on('turbolinks:load', function() {
  let mapOptions = {
    zoom: 10,
    center: new google.maps.LatLng(10.820303, 106.597862),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  function map_markers(mapOptions, address) {
    let map = new google.maps.Map(document.getElementById('map'), mapOptions);
    map_add_listener(map, address);
  };

  function map_add_listener(map, address) {
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
        type: 'GET',
        dataType: 'json',
        data: { position: position },
        success: function (data) {
          address.val(data.html[0].data.display_name);
          return true;
        },
      });
    });
  };

  let addressEmployee = $('#employee_current_address');
  let clientAddress = $('#client_address');
  if (addressEmployee[0] === undefined) {
    map_markers(mapOptions, clientAddress);
  } else {
    map_markers(mapOptions, addressEmployee);
  }

  $(document).on('click', '#show-location-emp, #show-location-client', function () {
    if (this.id == 'show-location-emp') {
      handler_address('/handler-address-emp', $('#employee_current_address').val(), $('#employee_current_address'));
    } else {
      handler_address('/handler-address-client', $('#client_address').val(), $('#client_address'));
    }
  });

  function handler_address(url, address, addressListener) {
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      data: { address: address },
      success: function (data) {
        let handler = Gmaps.build('Google');
        let map = handler.buildMap({
          provider: {},
          internal: { id: 'map' }
        }, function () {
          markers = handler.addMarkers([{
            "lat": data.html[0].data.lat,
            "lng": data.html[0].data.lon,
            "infowindow": "Your Address"
          }]);
          handler.bounds.extendWith(markers);
          handler.fitMapToBounds();
          handler.getMap().setZoom(12);
        });
        map = map.serviceObject;
        map_add_listener(map, addressListener);
        return true;
      },
    });
  }
});
