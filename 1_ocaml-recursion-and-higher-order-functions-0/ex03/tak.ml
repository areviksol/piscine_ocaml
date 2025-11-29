let tak x y z =
  let rec t x y z =
    if y < x then t (t (x - 1) y z) (t (y - 1) z x) (t (z - 1) x y)
    else z
  in
  t x y z


let () =
  print_endline (string_of_int (tak 1 2 3));       (* 3 *)
  print_endline (string_of_int (tak 5 23 7));      (* 7 *)
  print_endline (string_of_int (tak 9 1 0));       (* 1 *)
  print_endline (string_of_int (tak 1 1 1));       (* 1 *)
  print_endline (string_of_int (tak 0 42 0));      (* 0 *)
  print_endline (string_of_int (tak 23498 98734 98776));  (* 98776 *)
