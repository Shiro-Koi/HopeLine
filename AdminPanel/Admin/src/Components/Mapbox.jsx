import React, { useState, useEffect } from "react";
import Map, {
  Marker,
  NavigationControl,
  FullscreenControl,
  ScaleControl,
  GeolocateControl,
} from "react-map-gl";

<link
  href="https://api.tiles.mapbox.com/mapbox-gl-js/v<YOUR_MAPBOX_VERSION>/mapbox-gl.css"
  rel="stylesheet"
/>;

import { db } from "./Firebase";
import { onValue, ref } from "firebase/database";

function getMarkers(data) {
  if (data == null || data == undefined) return [];
  let keys = Object.keys(data);
  let result = Array(keys.length);
  for (let i = 0; i < keys.length; i++) {
    var d = data[keys[i]];
    result[i] = (
      <Marker
        longitude={d.longitude}
        latitude={d.latitude}
        color="red"
      ></Marker>
    );
  }
  return result.map((v) => v);
}
const Mapbox = () => {
  let [data, setData] = useState({});
  useEffect(() => {
    let dataRef = ref(db, "data");
    onValue(dataRef, (snapshot) => {
      let info = snapshot.val();
      setData((prev) => ({ ...prev, info }));
      return data;
    });
  }, []);

  return (
    <Map
      initialViewState={{
        longitude: 44.57,
        latitude: 35.57,
        zoom: 6.5,
        height: "100vh",
        width: "100%",
      }}
      onClick={(e) => {
        e.originalEvent.stopPropagation();
      }}
      style={{
        width: 1000,
        height: 500,
        borderRadius: 10,
        borderColor: "blue",
        borderStyle: "solid",
        borderWidth: "thin",
      }}
      mapStyle="mapbox://styles/mapbox/streets-v12"
      mapboxAccessToken="pk.eyJ1IjoiZHlhcnkwMTciLCJhIjoiY2wxaDhtams2MGJrcTNqbjJ5N2s2bTh5diJ9.cidFRjA1obU6y8MoJTy3RA"
    >
      <GeolocateControl position="top-left" />
      <FullscreenControl position="top-left" />
      <NavigationControl position="top-left" />
      <ScaleControl />
      {getMarkers(data.info)}
    </Map>
  );
};
export default Mapbox;
