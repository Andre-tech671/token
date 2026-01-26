import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

persistent actor Token {
  // Token properties
  stable var owner : Principal = Principal.fromText("e2sog-c54h3-...");
  stable var totalSupply : Nat = 10000000000;
  stable var symbol : Text = "AFI";

  // Balances map (HashMap is not stable!)
  transient var balances = HashMap.HashMap<Principal, Nat>(
    1, Principal.equal, Principal.hash
  );

  // Initialize in actor constructor
  balances.put(owner, totalSupply);

  public query func balanceOf(who: Principal) : async Nat {
    switch (balances.get(who)) {
      case null 0;
      case (?result) result;
    }
  };

  public query func getSymbol() : async Text {
    return symbol;
  };
};