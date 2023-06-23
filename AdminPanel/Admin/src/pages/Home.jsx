import React from "react";
import Mapbox from "../Components/Mapbox";
import { Note, ComponentA } from "../Components/Note";

const Home = () => {
  return (
    <div className="flex items-center justify-center flex-col bg-bg-third pt-10 m-0 p-0 text-blue-500">
      <h1 className="m-5 text-4xl">Map</h1>
      <div className="flex ">
        <Mapbox className="grow" />
        <Note />
      </div>
      <h1 className="m-10 text-4xl">Notes</h1>
      <div className="flex flex-wrap">
        <ComponentA />
      </div>
      <div className="text-4xl"></div>
    </div>
  );
};

export default Home;
