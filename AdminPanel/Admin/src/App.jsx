import SharedPage from "./pages/SharedPage";
import Home from "./pages/Home";
import "./App.css";
import {
  Route,
  createBrowserRouter,
  createRoutesFromElements,
  RouterProvider,
} from "react-router-dom";
import "mapbox-gl/dist/mapbox-gl.css";
import FrequentlyAskedQuestions from "./pages/FrequentlyAskedQuestions";

const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" element={<SharedPage />}>
      <Route index element={<Home />} />
      <Route path="/questions" element={<FrequentlyAskedQuestions />} />
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
