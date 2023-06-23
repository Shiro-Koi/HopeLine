/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        "bg-main": "#606C5D",
        "bg-secondary": "#FFF4F4",
        "bg-third": "#2B2730",
        "bg-fourth": "#6554AF",
      },
    },
  },
  plugins: [],
};
