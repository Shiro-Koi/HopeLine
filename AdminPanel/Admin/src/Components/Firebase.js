import { initializeApp } from "firebase/app";
import { getDatabase } from "firebase/database";

const firebaseConfig = {
  apiKey: "AIzaSyCuU-F3dhVMAmDJ5-0kN3R80iYkRV6woDQ",
  authDomain: "hope-line.firebaseapp.com",
  databaseURL:
    "https://hope-line-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "hope-line",
  storageBucket: "hope-line.appspot.com",
  messagingSenderId: "326771623166",
  appId: "1:326771623166:web:8ecdcb51c72a25cacd51af",
};

const app = initializeApp(firebaseConfig);
export const db = getDatabase(app);
