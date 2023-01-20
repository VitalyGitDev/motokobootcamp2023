import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Iter "mo:base/Iter";

actor {
  public func average_array(array : [Int]) : async Int {
    var sum : Int = 0;
    for (element in array.vals()) {
      sum += element;
    };
    return (sum / array.size());
  };

	public func character_count(text: Text, c: Char) : async Nat {
		var counter : Nat = 0;
		for (el in Text.toIter(text)) {
			if (Char.equal(el, c)) counter += 1;
		};

		return (counter);
	};

	public func factorial(n : Nat) :  async Nat {
    var res : Nat = 1;
    if (n == 0) return res;

		for (j in Iter.range(1, n)) {
			res := res * j;
		};
		return res;
	};

	public func number_of_words(text: Text) : async Nat {
		var counter : Nat = 0;
		for(word in Text.split(text, #char(' ')))
			if (Text.size(word) > 1) counter +=1;

		return counter;
	};

	public func find_duplicates(duplicated: [Nat]) : async [Nat] {
		var unique = Buffer.Buffer<Nat>(0);
		var dups = Buffer.Buffer<Nat>(0);
		for (item in duplicated.vals()) {
			if (Buffer.contains(unique, item, func(a: Nat, b: Nat) : Bool {a==b;})) {
				dups.append(Buffer.make(item));
			} else {
				unique.append(Buffer.make(item));
			};
		};
		return (Buffer.toArray(dups));
	};

  public query func convert_to_binary(n : Nat) : async Text {
    var bin : Text = "";
    var m : Nat = n;
    while (m > 0) {
			bin := Text.concat(Nat.toText(Nat.rem(m, 2)), bin);
      m := Nat.div(m, 2);
    };
    return bin;
  };

}