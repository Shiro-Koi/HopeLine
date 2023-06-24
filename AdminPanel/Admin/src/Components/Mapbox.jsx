import React from "react";
import Map from "react-map-gl";
import { useEffect } from "react";

<link
  href="https://api.tiles.mapbox.com/mapbox-gl-js/v<YOUR_MAPBOX_VERSION>/mapbox-gl.css"
  rel="stylesheet"
/>;

import { db } from "./Firebase";
import { onValue, ref } from "firebase/database";
let dataRef = ref(db, "data");
onValue(dataRef, (snapshot) => {
  const data = snapshot.val();
  console.log(data);
});

const Mapbox = () => {
  return (
    <Map
      className=" rounded-2xl"
      initialViewState={{
        longitude: 45.4351,
        latitude: 35.5558,
        zoom: 9.7,
      }}
      style={{ width: 800, height: 500, borderRadius: 10 }}
      mapStyle="mapbox://styles/mapbox/dark-v9"
      mapboxAccessToken="pk.eyJ1IjoiZHlhcnkwMTciLCJhIjoiY2wxaDhtams2MGJrcTNqbjJ5N2s2bTh5diJ9.cidFRjA1obU6y8MoJTy3RA"
    />
  );
};

export default Mapbox;
