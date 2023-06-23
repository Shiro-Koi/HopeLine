import React from "react";
import { Link } from "react-router-dom";
const Navbar = () => {
  return (
    <div className="bg-bg-secondary w-full flex justify-between items-center h-[12vh]">
      <div className="logo text-slate-950 text-2xl px-5">
        <Link to="/">
          <span className="text-blue-700">HOPE </span>{" "}
          <span className="bg-blue-700 text-white rounded-xl p-2"> LINE</span>
        </Link>
      </div>
      <ul className="flex text-slate-950 px-5">
        <li>
          <Link to="/">Dashboard</Link>{" "}
        </li>
        <li className="px-5">
          <Link to="/questions">Frequently Asked Questions</Link>{" "}
        </li>
        <li>Developers</li>
      </ul>
    </div>
  );
};

export default Navbar;
