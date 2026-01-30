import ReactDOM from 'react-dom'
import React from 'react'
import App from "./components/App";
import "../assets/main.css";

const init = async () => { 
  ReactDOM.render(<App />, document.getElementById("root"));
}

init();


