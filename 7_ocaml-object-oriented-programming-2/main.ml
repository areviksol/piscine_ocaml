let () =
  let h = new hydrogen in
  let c = new carbon in
  let o = new oxygen in
  let n = new nitrogen in
  let na = new sodium in
  let fe = new iron in

  Printf.printf "Testing atoms...\n\n";

  let atoms = [ h; c; o; n; na; fe ] in
  let rec print_all lst =
    match lst with
    | [] -> ()
    | a :: rest ->
        Printf.printf "%s\n" (a#to_string);
        print_all rest
  in
  print_all atoms;

  Printf.printf "\nEquality tests:\n";
  Printf.printf "Hydrogen = Hydrogen ? %B\n" (h#equals (new hydrogen));
  Printf.printf "Hydrogen = Oxygen ? %B\n" (h#equals o)
