import React from 'react'
import ReactDOM from 'react-dom/client'
import App from "./components/App";
import '../public/main.css'

const init = async () => { 
  ReactDOM.createRoot(document.getElementById("root")).render(
    <React.StrictMode>
      <App />
    </React.StrictMode>
  );
}

init();

