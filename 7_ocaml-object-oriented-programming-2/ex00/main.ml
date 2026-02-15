let () =
  let h = new Atom.hydrogen in
  let c = new Atom.carbon in
  let o = new Atom.oxygen in
  let n = new Atom.nitrogen in
  let na = new Atom.sodium in
  let cl = new Atom.chlorine in

  print_endline h#to_string;
  print_endline c#to_string;
  print_endline o#to_string;
  print_endline n#to_string;
  print_endline na#to_string;
  print_endline cl#to_string;

  print_endline (string_of_bool (h#equals (new Atom.hydrogen)));
  print_endline (string_of_bool (h#equals c))
