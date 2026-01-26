import React, { useState } from "react";
import { Principal } from "@dfinity/principal";
import { token_backend } from "../../../declarations/token_backend";

function Balance() {

  const [inputValue, setInput] = useState("");
  const [balanceResult, setBalance] = useState("N/A");
  const [cryproSymbol, setSymbol] = useState("");
  const [isHidden, setIsHidden] = useState(true);
  
  async function handleClick() {
     //console.log("Requesting balance for Principal ID:", inputValue);

     // Convert the input string to a Principal
     const principal = Principal.fromText(inputValue);
     // Request the balance from the backend canister
     const balance = await token_backend.balanceOf(principal);

      // Update the state with the retrieved balance
      setBalance(balance.toLocaleString());
      // Fetch and set the token symbol
      setSymbol(await token_backend.getSymbol());
      // Unhide the balance display
      setIsHidden(false);
    
  }


  return (
    <div className="window white">
      <label>Check account token balance:</label>
      <p>
        <input
          id="balance-principal-id"
          type="text"
          placeholder="Enter a Principal ID"
          value={inputValue}
          onChange={(e)=>setInput(e.target.value)}
        />
      </p>
      <p className="trade-buttons">
        <button
          id="btn-request-balance"
          onClick={handleClick}
        >
          Check Balance
        </button>
      </p>
<p hidden = {isHidden} >This account has a balance of {balanceResult} {cryproSymbol}.</p>
    </div>
  );
}

export default Balance;

