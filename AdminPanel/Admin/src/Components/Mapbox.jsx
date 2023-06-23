import React from "react";
import Map from "react-map-gl";
<link
  href="https://api.tiles.mapbox.com/mapbox-gl-js/v<YOUR_MAPBOX_VERSION>/mapbox-gl.css"
  rel="stylesheet"
/>;

const Mapbox = () => {
  return (
    <Map
      initialViewState={{
        longitude: 45.4351,
        latitude: 35.5558,
        zoom: 9.7,
      }}
      style={{ width: 800, height: 500 }}
      mapStyle="mapbox://styles/mapbox/satellite-streets-v12"
      mapboxAccessToken="pk.eyJ1IjoiZHlhcnkwMTciLCJhIjoiY2wxaDhtams2MGJrcTNqbjJ5N2s2bTh5diJ9.cidFRjA1obU6y8MoJTy3RA"
    />
  );
};

export default Mapbox;
