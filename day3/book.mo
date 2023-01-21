import Text "mo:base/Text";
import Nat "mo:base/Nat";

module Book {
	public type Book = {
		title: Text;
		pages: Nat;
	};

	public func create_book(title: Text, pages: Nat) : Book {
		let new_book: Book = { title; pages; };
		return new_book;
	}
}

