import List "mo:base/List";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Book "book";

actor {
	var book_store = List.nil<Book.Book>();

	public func add_book(title: Text, pages: Nat) : async Book.Book {
		let new_book = Book.create_book(title, pages);
		book_store := List.push(new_book, book_store);
		return new_book;
	};

	public func get_books() : async [Book.Book] {
		return List.toArray(book_store);
	};

}