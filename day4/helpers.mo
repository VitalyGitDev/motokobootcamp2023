import Buffer "mo:base/Buffer";
import List "mo:base/List";
import Bool "mo:base/Bool";
import Nat "mo:base/Nat";

module {
	public func unique<T>(l : List.List<T>, equal: (T,T) -> Bool) : List.List<T> {
		var uniq = Buffer.Buffer<T>(0);
		for (item in List.toIter(l)) {
			if (not Buffer.contains(uniq, item, equal)) {
				uniq.append(Buffer.make(item));
			};
		};
		return (List.fromArray(Buffer.toArray(uniq)));
	};

	public func reverse<T>(l : List.List<T>) : List.List<T> {
		var reversed = Buffer.Buffer<T>(0);
		var temp = Buffer.Buffer<T>(0);
		for (item in List.toIter(l)) {
			temp := reversed;
			reversed := Buffer.make<T>(item);
			reversed.append(temp);
		};
		return (List.fromArray(Buffer.toArray(reversed)));
	};

	public func find_in_buffer<T> (buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) : ?Nat {
		var i : Nat = 0;
		while (i <= buf.size() - 1) {
			if (equal(buf.get(i), val)) {
				return ?i;
			};
			i += 1;
		};
		return null;
	}
}