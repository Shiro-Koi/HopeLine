import SharedPage from './pages/SharedPage'
import Home from './pages/Home'
import './App.css'
import {
  Route,
  createBrowserRouter,
  createRoutesFromElements,
  RouterProvider,
} from "react-router-dom";
const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" element={<SharedPage />}>
      <Route index element={<Home />} />
      {/* <Route path="/About" element={<AboutUsPage />} />
      <Route path="/Contact" element={<ContactUs />} /> */}
    </Route>
  )
);

function App() {
  return (
    <>
      <RouterProvider router={router} />
    </>
  );
}
export default App;
