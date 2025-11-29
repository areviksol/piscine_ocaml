let fibonacci n =
  let rec aux n a b =
    if n = 0 then a
    else aux (n - 1) b (a + b)
  in
  if n < 0 then -1
  else aux n 0 1


let () =
  print_endline (string_of_int (fibonacci (-42)));  (* -1 *)
  print_endline (string_of_int (fibonacci 0));      (* 0 *)
  print_endline (string_of_int (fibonacci 1));      (* 1 *)
  print_endline (string_of_int (fibonacci 2));      (* 1 *)
  print_endline (string_of_int (fibonacci 3));      (* 2 *)
  print_endline (string_of_int (fibonacci 6));      (* 8 *)
  print_endline (string_of_int (fibonacci 10));      (* 55 *)
