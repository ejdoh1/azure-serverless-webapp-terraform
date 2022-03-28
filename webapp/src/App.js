import logo from "./logo.svg";
import "./App.css";
import { useEffect, useState } from "react";

function App() {
  let [response, setResponse] = useState({
    message: "loading...",
    uuid: "loading...",
  });
  const refreshApiResponse = () => {
    fetch(process.env.REACT_APP_API_URL)
      .then((d) => d.json())
      .then((j) => setResponse(j));
  };

  useEffect(() => {
    refreshApiResponse();
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>Azure Function App API Response</p>
        <p>API URL: {process.env.REACT_APP_API_URL}</p>
        <p>Response message: {response.message}</p>
        <p>Response UUID: {response.uuid}</p>
      </header>
    </div>
  );
}

export default App;
