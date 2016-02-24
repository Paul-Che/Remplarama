
// handler = Gmaps.build('Google', { markers: { maxRandomDistance: null } });
// handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){

//   markers = handler.addMarkers(<%=raw @markers.to_json %>);

//   _.each(<%=raw @markers.to_json %>, function(json, index){
//     json.marker = markers[index];
//     $(".user-" + json.id).on('mouseover', function() {
//       handler.getMap().setZoom(14);
//       json.marker.setMap(handler.getMap());
//       json.marker.panTo();
//       google.maps.event.trigger(json.marker.getServiceObject(), 'click');
//     });
//     });
//   handler.bounds.extendWith(markers);
//   handler.fitMapToBounds();
//   handler.getMap().setCenter(new google.maps.LatLng(<%= @user.latitude %>, <%= @user.longitude %>));
//   handler.getMap().setZoom(14);
// });

