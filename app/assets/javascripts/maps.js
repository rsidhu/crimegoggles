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

  var styledMap = new google.maps.StyledMapType(styles,
      {name: "Styled Map"});

  var heatmapData = [
    new google.maps.LatLng(34.0108067,-118.4922241),
    new google.maps.LatLng(34.0108069,-118.4922249),
    new google.maps.LatLng(34.0108071,-118.4922251),
    new google.maps.LatLng(34.0108073,-118.4922261),
    new google.maps.LatLng(34.0108075,-118.4922271),
    new google.maps.LatLng(34.0108078,-118.4922281),
    new google.maps.LatLng(34.0108081,-118.4922291),
    new google.maps.LatLng(34.0108084,-118.4922101),
    new google.maps.LatLng(34.0108086,-118.4922111),
    new google.maps.LatLng(34.0108092,-118.4922121),
    new google.maps.LatLng(34.0108096,-118.4922131),
    new google.maps.LatLng(34.0108099,-118.4922141),
    new google.maps.LatLng(34.0108103,-118.4922151),
    new google.maps.LatLng(34.0108107,-118.4922161)
  ];

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

 var heatmap = new google.maps.visualization.HeatmapLayer({
    data: heatmapData,
    setMap: map
  });

}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?' +
      '&signed_in=true&callback=initialize';
  document.body.appendChild(script);
}


window.onload = loadScript;