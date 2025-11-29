let print_color c =
  print_string (Color.toString c);
  print_string " / ";
  print_endline (Color.toStringVerbose c)

let rec print_list lst =
  if lst <> [] then
    (print_color (List.hd lst);
     print_list (List.tl lst))
  else
    ()

let () =
  print_endline "== All colors ==";
  print_list Color.all
