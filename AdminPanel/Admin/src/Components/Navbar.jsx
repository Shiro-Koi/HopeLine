import React from "react";

const Navbar = () => {
  return (
    <div className="bg-bg-secondary w-full flex justify-between items-center h-[12vh]">
      <div className="logo text-slate-950 text-2xl px-5">
        <span className="text-blue-700">HOPE </span>{" "}
        <span className="bg-blue-700 text-white rounded-xl p-2"> LINE</span>
      </div>
      <ul className="flex text-slate-950 px-5">
        <li>Admin Dashboard</li>
        <li className="px-5">Frequently Asked Questions</li>
        <li>Developers</li>
      </ul>
    </div>
  );
};

export default Navbar;
