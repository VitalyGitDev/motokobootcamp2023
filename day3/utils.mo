import Int from "mo:base/Int";
import Nat from "mo:base/Nat";
import Buffer from "mo:base/Buffer";

module {
	public func second_maximum(array : [Int]) :  Int {
		// if (array.size() < 2) throw Error("Very short Array!")
		var max_vals = Buffer.Buffer<Int>(2);
		for (el in array.vals()) {
			if (not Buffer.isEmpty(max_vals) and el > max_vals.get(0)) {
				max_vals.insert(1, max_vals.get(0));
				max_vals.insert(0, el);
			};
			if (max_vals.size() == 2 and el < max_vals.get(0) and el > max_vals.get(1)) {
				max_vals.insert(1, el);
			};
			if (max_vals.size() == 1 and el < max_vals.get(0)) {
				max_vals.insert(1, el);
			};
			if (Buffer.isEmpty(max_vals)) {
				max_vals.insert(0, el);
			};
		};

		return max_vals.get(1);
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

	public func remove_even(array : [Nat]) : [Nat] {
		var buf = Buffer.fromArray<Nat>(array);
		buf.filterEntries(func(_, x) = not can_divide(x, 2));
		return buf.toArray(); 
	};

	public func drop<T>(xs : [T], n : Nat) : [T] {
		var buf = Buffer.fromArray<T>(xs);
		buf.filterEntries(func(i, x) = i >= n );
		return buf.toArray(); 
	};
}
