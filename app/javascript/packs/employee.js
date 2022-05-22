$(document).on('turbolinks:load', function () {
  let mapOptions = {
    zoom: 10,
    center: new google.maps.LatLng(10.820303, 106.597862),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  function mapMarkers(mapOptions) {
    let map = new google.maps.Map(document.getElementById('map'), mapOptions);
    google.maps.event.addListener(map, 'click', function (event) {
      let marker = new google.maps.Marker({
        position: event.latLng,
        map: map
      });
      let position = [event.latLng.lat(), event.latLng.lng()];
      $.ajax({
        url: '/show-address',
        type: 'POST',
        dataType: 'json',
        data: { position: position },
        success: function (data) {
          $('#employee_current_address').val(data.html[0].data.display_name);
          return true;
        },
      });
    });
  };

  mapMarkers(mapOptions);
  // $(document).on('keyup', '#employee_current_address', function () {
  //   let address = $('#employee_current_address').val();
  //   $('#list-address').show();
  //   $.ajax({
  //     url: '/search-address',
  //     type: 'POST',
  //     dataType: 'json',
  //     data: { address: address },
  //     success: function (data) {
  //       $('#list-address')[0].innerHTML = data.html;
  //       return true;
  //     },
  //   });
  // });

  $(document).on('click', '#show-location', function () {
    let address = $('#employee_current_address').val();
    $('#list-addzess').hide();
    $.ajax({
      url: '/handler-address',
      type: 'POST',
      dataType: 'json',
      data: { address: address },
      success: function (data) {
        let handler = Gmaps.build('Google');
        handler.buildMap({ provider: {}, internal: { id: 'map' } }, function () {
          markers = handler.addMarkers([{ "lat": data.html[0].data.lat, "lng": data.html[0].data.lon, "infowindow": "Your Address" }]);
          handler.bounds.extendWith(markers);
          handler.fitMapToBounds();
          handler.getMap().setZoom(12);
        });
        return true;
      },
    });
  });

  // $(document).on('click', '#map', function () {
  //   let mapOptions = {
  //     zoom: 10,
  //     center: new google.maps.LatLng(0, 0),
  //     mapTypeId: google.maps.MapTypeId.ROADMAP
  //   };
  //   mapMarkers(mapOptions);
  // });
});
