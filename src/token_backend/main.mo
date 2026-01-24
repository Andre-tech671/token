import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";


  actor Token {
  // Token properties
  // Token Name: AFI Token
  // Token Symbol: AFI
  // Total Supply: 10,000,000,000
  // Owner: e2sog-c54h3-6wtdu-wvm7d-ihfod-oqsnz-uakz5-ne2zl-p4xdk-muaue-aae
  var owner : Principal = Principal.fromText("e2sog-c54h3-6wtdu-wvm7d-ihfod-oqsnz-uakz5-ne2zl-p4xdk-muaue-aae");
  var totalSupply : Nat = 10000000000;
  var symbol : Text = "AFI";

  // Mapping of account balances
  // Using HashMap to store balances
  // Key: Principal (account address)
  // Value: Nat (account balance)
  // Initialize the owner's balance with the total supply
   var balances = HashMap.HashMap<Principal, Nat> (1, Principal.equal, Principal.hash);
  balances.put(owner, totalSupply);

  

  public query func balanceOf(who: Principal) : async Nat {
    // Returns the balance of the specified account
    // If the account does not exist, returns 0
    // Fetch balance from the balances map
    let balance : Nat = switch (balances.get(who)) {
      case null 0;
      case (?result) result;
    };

    return balance;
  };
};
