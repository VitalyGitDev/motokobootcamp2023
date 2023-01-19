import Nat "mo:base/Nat";

actor {

	var counter : Nat = 0;

	public func multiply(n : Nat, m : Nat) : async Nat {
		return Nat.mul(n, m);
	};

	public func volume(n : Nat) : async Nat {
		return Nat.pow(n, 3);
	};

	public func hours_to_minutes(n : Nat) : async Nat {
		return Nat.mul(n, 60);
	};

	public func set_counter(n : Nat) : async () {
		counter := n;
		return;
	};

	public func get_counter() : async Nat {
		return (counter);
	};

	func can_divide(n: Nat, m : Nat) : Bool {
		if (
			Nat.greaterOrEqual(n, m) and
			Nat.greater(n, 0) and
			Nat.greater(m, 0) and
			Nat.equal(Nat.rem(n, m), 0)) {
			return (true);
		};

		return (false);
	};

	public func test_divide(n: Nat, m : Nat) : async Bool {
		return (can_divide(n, m));
	};

	public func is_even(n : Nat) : async Bool {
		return (can_divide(n, 2));
	};

}