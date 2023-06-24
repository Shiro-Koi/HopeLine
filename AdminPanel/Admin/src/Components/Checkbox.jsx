import React, { useEffect, useState } from "react";

const Checkbox = (props) => {
  // const { mymap } = useMap();
  // useEffect(() => {
  //   if (!mymap) {
  //     return undefined;
  //   }
  return (
    <ul className="w-1/3 h-auto flex justify-start items-center flex-col text-sm mr-5 font-medium text-gray-900 bg-white border border-gray-200 rounded-lg dark:bg-gray-700 dark:border-gray-600 dark:text-white">
      <h3 className=" py-5 pl-2  font-semibold text-gray-900 dark:text-white">
        Check for Completion
      </h3>
      {Object.keys(props.data).map((data, index) => {
        let d = props.data[data];
        console.log(props);
        return (
          <li
            key={index}
            className="w-full border-b border-gray-200 rounded-t-lg dark:border-gray-600"
          >
            <div className="flex items-center pl-3">
              <input
                id="react-checkbox"
                type="checkbox"
                value=""
                className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 dark:focus:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500"
              />
              <label
                // onClick={setTimeout(() => {
                //   mymap.flyTo({ center: [-d.longitude, d.latitude] }), 0;
                // })}
                htmlFor="react-checkbox"
                className="w-full py-3 ml-2 text-sm font-medium text-gray-900 dark:text-gray-300"
              >
                Latitude: {d.latitude}, Longitude: {d.longitude}
              </label>
            </div>
          </li>
        );
      })}
    </ul>
  );
};
export default Checkbox;
