
# <a id="questions"> 🙋 Questions </a>
1. How much is the current memory capacity of a canister? - 48Gb
2. What is the issue with the following code sample? - For mutation we MUST use VAR instead of LET 'var counter : Nat = 0;'
```
actor {
  let counter : Nat = 0;
  public func increment_counter() : async () {
    counter := counter + 1;
  };
}
```
3. What is the issue with the following code sample? - Nat can't be assigned to Text variable, we must use "0" for it.
```
actor {
  var message : Text = 0;

  public query func change_message(new_message : Text) : async () {
    message := new_message;
    return;
  };
  
  public query func see_message() : async Text {
    return(message);
  };
}
```
4.  False or True: we can remove the keyword **async** for the return argument of a query function since queries are faster to answer.
    - False, because async is about asyncronous execution model but not about execution spead.