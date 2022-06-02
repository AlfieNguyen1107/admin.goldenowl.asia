$(document).on('turbolinks:load', function () {
  let mapOptions = {
    zoom: 10,
    center: new google.maps.LatLng(10.820303, 106.597862),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  let map = new google.maps.Map(document.getElementById('map'), mapOptions);
  mapAddListener(map);

  function mapAddListener(map) {
    google.maps.event.addListener(map, 'click', function (event) {
      let marker = new google.maps.Marker({
        position: event.latLng,
        map: map
      });
      let position = [event.latLng.lat(), event.latLng.lng()];
      $.ajax({
        url: '/geocoders/show-address',
        type: 'GET',
        dataType: 'json',
        data: { position: position },
        success: function (data) {
          $('#google-address-input').val(data.html[0].data.display_name);
          return true;
        },
      });
    });
  };

  $('body').on('click', '#show-location', function () {
    let address = $('#google-address-input').val()
    $.ajax({
      url: '/geocoders/handler-address',
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
        mapAddListener(map);
        return true;
      },
    });
  });
});
