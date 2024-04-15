import React from 'react';
import {
    createBrowserRouter,
    RouterProvider,
    BrowserRouter as Router,
    Routes,
    Route
} from "react-router-dom";
import EarthquakeList from '../components/earthquake-list.component';
import EarthquakeDetails from '../components/earthquake-details.component';

export const router = createBrowserRouter([
    {
        path: "/",
        element: <EarthquakeList />,
    },
    {
        path: "/earthquake/:id",
        element: <EarthquakeDetails />,
    
    }
]);