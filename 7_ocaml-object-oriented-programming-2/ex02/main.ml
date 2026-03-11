let () =
  let m = new Alkane.methane in
  let e = new Alkane.ethane in
  let o = new Alkane.octane in

  print_endline m#to_string;
  print_endline e#to_string;
  print_endline o#to_string;

  print_endline (string_of_bool (m#equals (new Alkane.methane)));
  print_endline (string_of_bool (m#equals e))
