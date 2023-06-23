import React from "react";
import { useState } from "react";
import { useBetween } from "use-between";

const useFormState = () => {
  const [array, setArray] = useState([]);
  const [noteTitle, setNoteTitle] = useState(" ");
  const [noteDetails, setNoteDetails] = useState(" ");
  return {
    array,
    setArray,
    noteTitle,
    setNoteTitle,
    noteDetails,
    setNoteDetails,
  };
};
const useSharedFormState = () => useBetween(useFormState);

const Note = () => {
  const { noteTitle, setNoteTitle } = useSharedFormState();
  const { noteDetails, setNoteDetails } = useSharedFormState();
  const { array, setArray } = useSharedFormState();

  return (
    <div className="bg-bg-main w-1/3 h-full mx-5 flex flex-col items-start ">
      <label
        htmlFor="noteTitle"
        className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
      >
        Note Title
      </label>
      <input
        type="text"
        name="noteTitle"
        placeholder="Note Title"
        onChange={(e) => setNoteTitle(e.target.value)}
        className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
      />

      <label
        htmlFor="discription"
        className="block mb-2 mt-4 text-sm font-medium text-gray-900 dark:text-white"
      >
        Details
      </label>
      <textarea
        name="discription"
        cols="30"
        rows="10"
        onChange={(e) => setNoteDetails(e.target.value)}
        placeholder="Details"
        className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
      ></textarea>
      <button
        onClick={() => setArray([...array, { noteTitle, noteDetails }])}
        type="submit"
        className="self-center text-white bg-blue-700 hover:bg-blue-800 mt-10 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
      >
        Submit
      </button>
    </div>
  );
};

const ComponentA = () => {
  // Use the shared hook!

  const { array } = useSharedFormState();
  return array.map((item, index) => (
    <div
      key={index}
      className="bg-bg-secondary w-[250px] p-5 h-[40vh] rounded-xl text-black m-5  shadow-xl shadow-black "
    >
      <h1
        key={index}
        className=" border-b-4 p-2 text-opacity-50 text-slate-500 "
      >
        {item.noteTitle}
      </h1>
      <div className="flex flex-col justify-between h-full p-1">
        <p className="p-1">{item.noteDetails}</p>
        <h4 className="text-sm p-1 mb-[30px] self-center">
          `{new Date().getDate()}/{new Date().getMonth() + 1}/
          {new Date().getFullYear()}`
        </h4>
      </div>
    </div>
  ));
};

export { Note, ComponentA };
