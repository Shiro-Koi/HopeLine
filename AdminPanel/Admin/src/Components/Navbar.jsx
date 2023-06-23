import React from "react";

const Navbar = () => {
  return (
    <div className="bg-bg-secondary w-full flex justify-between items-center h-[15vh]">
      <div className="logo text-slate-950 ">HOPE LINE</div>
      <ul>
        <li>Admin Dashboard</li>
        <li>Frequently Asked Questions</li>
        <li>Developers</li>
      </ul>
    </div>
  );
};

export default Navbar;
