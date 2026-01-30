import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import HashMap "mo:base/HashMap";



persistent actor Token {
    var owner : Principal = Principal.fromText("e2sog-c54h3-6wtdu-wvm7d-ihfod-oqsnz-uakz5-ne2zl-p4xdk-muaue-aae");
    var totalSupply : Nat = 1000000000;
    var symbol : Text = "AFI";


    transient var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);
    balances.put(owner, totalSupply);


    public query func balanceOf (who: Principal) : async Nat {
        let balance : Nat = switch (balances.get(who)) {
            case null 0;
            case (?result) result;
        };
        return balance;
    };
};