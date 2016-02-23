$(document).ready(function() {
  handler = Gmaps.build('Google', { markers: { maxRandomDistance: null } });
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){

    markers = handler.addMarkers(<%=raw @hash.to_json %>);

    _.each(<%=raw @hash.to_json %>, function(json, index){
      json.marker = markers[index];
      $(".location-" + json.id).on('mouseover', function() {
        handler.getMap().setZoom(14);
        json.marker.setMap(handler.getMap()); //because clusterer removes map property from marker
        json.marker.panTo();
        google.maps.event.trigger(json.marker.getServiceObject(), 'click');
      });
      });
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setCenter(new google.maps.LatLng(<%= @city.latitude %>, <%= @city.longitude %>));
    handler.getMap().setZoom(14);
  });
});
