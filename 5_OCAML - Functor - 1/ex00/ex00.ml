(* First, define a module for sets of strings *)
module StringSet = Set.Make(String)

let () =
  (* Create a set from a list of strings *)
  let set =
    List.fold_right StringSet.add [ "foo"; "bar"; "baz"; "qux" ] StringSet.empty
  in

  (* Iterate over the set and print each element *)
  StringSet.iter print_endline set;

  (* Concatenate all elements of the set into a single string *)
  print_endline (StringSet.fold ( ^ ) set "")
