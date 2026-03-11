let () =
  let w = new Molecule.water in
  let co2 = new Molecule.carbon_dioxide in
  let m = new Molecule.methane in
  let a = new Molecule.ammonia in
  let g = new Molecule.glucose in

  print_endline w#to_string;
  print_endline co2#to_string;
  print_endline m#to_string;
  print_endline a#to_string;
  print_endline g#to_string;

  print_endline (string_of_bool (w#equals (new Molecule.water)));
  print_endline (string_of_bool (w#equals co2))
