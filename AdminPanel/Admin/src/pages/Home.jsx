import React from "react";
import Mapbox from "../Components/Mapbox";
import { Note, ComponentA } from "../Components/Note";
import Checkbox from "../Components/Checkbox";
import { useEffect, useState } from "react";
import { onValue, ref } from "firebase/database";
import { db } from "./../Components/Firebase";

const Home = () => {
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
    <div className="flex items-start justify-center flex-col bg-bg-third pt-10 m-0 p-0 text-blue-500">
      <h1 className="m-10 text-4xl self-start">Map</h1>
      <div className="flex mx-10 ">
        {data.info && <Checkbox data={data.info} />}
        <Mapbox className="grow mx-10 " />
        <Note className="" />
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
