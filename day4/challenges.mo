import Bool "mo:base/Bool";
import List "mo:base/List";
import Helpers "helpers";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";

actor {
	public func unique( l: List.List<Nat>) : async List.List<Nat> {
		return (Helpers.unique<Nat>(l, func(x: Nat, y: Nat) : Bool { x==y; }));
	}

	public func reverse( l: List.List<Nat>) : async List.List<Nat> {
		return Helpers.reverse<Nat>(l);
	}

	public shared({ caller }) func is_anynomous() : async Bool {
		return Principal.isAnonymous(caller);
	}; 

	public func find_in_buffer(buf: List.List<Nat>, val: Nat) : async ?Nat {
		return Helpers.find_in_buffer<Nat>(Buffer.fromArray(List.toArray(buf)), val, func(a: Nat, b: Nat) : Bool { a==b; });
	}

	let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

	public shared ({ caller }) func add_username(name : Text) : async () {
		usernames.put(caller, name);
	};

	public shared get_usernames() : async [(Principal, Text)] {
		return Iter.toArray(usernames.entries());
	};
}