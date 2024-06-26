import { Controller } from "@hotwired/stimulus";
import React from 'react';
import { createRoot } from 'react-dom/client';
import { RouterProvider } from "react-router-dom";
import { router } from '../routes';

// Connects to data-controller="react"
export default class extends Controller {
  connect() {
    const app = document.getElementById("app");
    createRoot(app).render(<RouterProvider router={router} />);
  }
}
