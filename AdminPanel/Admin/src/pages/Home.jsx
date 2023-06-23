import React from "react";
import Mapbox from "../Components/Mapbox";

const Home = () => {
  return (
    <div className="flex items-center justify-center flex-col bg-bg-main h-[80vh] m-0 p-0">
      <Mapbox />
      <div className="text-4xl"></div>
    </div>
  );
};

export default Home;
