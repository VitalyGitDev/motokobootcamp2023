# Questions 🙋

1. Who controls the ledger canister?
	- Its network of validator nodes.
2. What is the subnet of the canister with the id: **mwrha-maaaa-aaaab-qabqq-cai**? How many nodes are running this subnet?  
	- SUBNET: pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe. Node Machines - 16.
3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?
	- 5%
4. What is wrong with the following code?
```
actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
 
}
```
	- USeless variables n and t

5. What is wrong with the following code?
```
actor {
  var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func show_languages(language : Text) : async [var Text] {
    return (languages);
  };
 
}
```
	- Useless func param 'language'. 
		As we dont perform any state update and we defined immutable array - we should replace 'var languages : [var Text] ' with 'let languages : [Text] ',
		and func result type should be 'async [Text]'

6. What is wrong with the following code?
```
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func add_language(new_language: Text) : async [Text] {
    languages := Array.append<Text>(languages, [new_language]);
    return (languages);
  };
 
}
```
	- Array.append() is deprecated, we should do it with Buffer like:
```
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func add_language(new_language: Text) : async [Text] {
		var buf_langs = Buffer.Buffer<Text>(languages.size());
		for (lang in languages.vals()) buf_langs.add(lang);
		if (not Buffer.contains(buf_langs, new_language, func(a: Text, b: Text) : Bool {a==b;})) {
			buf_langs.add(new_language);
			languages := buf_langs.toArray();
		};
    return (languages);
  };
}
		

```
