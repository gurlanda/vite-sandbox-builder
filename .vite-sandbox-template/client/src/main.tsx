import React from 'react';
import ReactDOM from 'react-dom/client';
import {
  Route,
  RouterProvider,
  createBrowserRouter,
  createRoutesFromElements,
} from 'react-router-dom';

import App from './App.tsx';
import paths from './paths.ts';
import Home from './pages/Home';
import About from './pages/About.tsx';
import './index.css';

const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path={paths.home} element={<App />}>
      <Route index element={<Home />} />
      <Route path={paths.about} element={<About />} />
    </Route>
  )
);

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
