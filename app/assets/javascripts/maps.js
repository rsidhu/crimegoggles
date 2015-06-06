function initialize() {
  var styles = [
    {
      stylers: [
      { invert_lightness: true },
      { weight: 1.0 },
      { hue: "#00ff6f" },
      { saturation: 66 }
    ]
    },{
      featureType: "road",
      elementType: "geometry",
      stylers: [
        { lightness: 100 },
        { visibility: "simplified" }
      ]
    },{
      featureType: "road",
      elementType: "labels",
      stylers: [
        { visibility: "on" }
      ]
    }
  ];
  var styles = {}

  var styledMap = new google.maps.StyledMapType(styles,
      {name: "Styled Map"});

  var mapOptions = {
    zoom: 13,
    center: new google.maps.LatLng(34.0108067,-118.4922241),
    mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
    }
  };

  var map = new google.maps.Map(document.getElementById('googleMap'),
    mapOptions);

  map.setOptions({styles: styles});
  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');


  //Grab data from JSON API
  var url = window.location.origin + window.location.pathname + ".json" + window.location.search

  $.get(url, function(results){

    var bounds = new google.maps.LatLngBounds();

    var coords = [];
    for(var i = 0; i < results.length; i++){

      var coord = new google.maps.LatLng(results[i].lat, results[i].lon)
      coords.push({location: coord, weight: results[i].weight})
      bounds.extend(coord)

    }
  
    var heatmap = new google.maps.visualization.HeatmapLayer({
      data: coords,
      dissipating: false,
      radius: 0.007
    });
    heatmap.setMap(map)

    map.fitBounds(bounds)

  })

}

// The init function needs to run on load
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize)
