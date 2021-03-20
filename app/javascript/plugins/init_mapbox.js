import mapboxgl from 'mapbox-gl';
import * as turf from '@turf/turf';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });

};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
};

const buildPolygon = (map) => {
  const mapElement = document.getElementById('map');
  const cityCoordinates = JSON.parse(mapElement.dataset.cityCoordinates);
  const geojson = {
    'type': 'FeatureCollection',
    'features': [
    {
    'type': 'Feature',
    'geometry': cityCoordinates
    }
    ]
    };
  map.on('load', function () {
    map.addSource('maine', {
    'type': 'geojson',
    'data': geojson
    });
    map.addLayer({
    'id': 'maine',
    'type': 'fill',
    'source': 'maine',
    'layout': {},
    'paint': {
    'fill-color': '#34113F',
    'fill-opacity': 0.8
    }
    });
    const bbox = turf.bbox(geojson);
    map.fitBounds(bbox, { padding: 70, maxZoom: 12, duration: 3000 });
  });
}

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    buildPolygon(map);
    // addMarkersToMap(map, markers);
    // fitMapToMarkers(map, markers);
    map.addControl(new mapboxgl.NavigationControl());
    // map.scrollZoom.disable();
  }
};


export { initMapbox };
