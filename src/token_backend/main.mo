import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
persistent actor Token {
  // Token properties
  stable var owner : Principal = Principal.fromText("e2sog-c54h3-6wtdu-wvm7d-ihfod-oqsnz-uakz5-ne2zl-p4xdk-muaue-aae");
  stable var totalSupply : Nat = 10000000000;
  stable var symbol : Text = "AFI";

  // Balances map (HashMap is not stable!)
  transient var balances = HashMap.HashMap<Principal, Nat>(
    1, Principal.equal, Principal.hash
  );

  // Initialize in actor constructor
  balances.put(owner, totalSupply);

// Query function to get balance of an account
  public query func balanceOf(who: Principal) : async Nat {
    let balance = switch (balances.get(who)) {
      case null 0;
      case (?result) result;
    };
    return balance;
  };

// Added getSymbol function
  public query func getSymbol() : async Text {
    return symbol;
  };

// Faucet function to pay out tokens
  public shared(msg) func payOut() : async Text {
    //Debug.print(debug_show(msg.caller));

    
      if(balances.get(msg.caller) == null) {
         let amount = 10000;
          balances.put(msg.caller, 10000);
      return "Successfully paid out tokens!";
      } else {
        return "You have already claimed your tokens.";
      }; 
   
  };


  public shared(msg) func transfer (to: Principal, amount: Nat): async Text {

    let fromBalance = await balanceOf(msg.caller);
    if (fromBalance > amount){
      let newFromBalance: Nat = fromBalance - amount;
      balances.put(msg.caller, newFromBalance);

      let toBalance = await  balanceOf(to);
      let newToBalance = toBalance + amount;
      balances.put(to, newToBalance);

       return "success";

    }else{
       return "insuffient Funds"
    }

  };
  

};