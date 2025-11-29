let ackermann m n =
  let rec a m n =
    if m < 0 || n < 0 then -1
    else if m = 0 then n + 1
    else if n = 0 then a (m - 1) 1
    else a (m - 1) (a m (n - 1))
  in
  a m n


let () =
  print_endline (string_of_int (ackermann (-1) 7));   (* -1 *)
  print_endline (string_of_int (ackermann 0 0));      (* 1 *)
  print_endline (string_of_int (ackermann 2 3));      (* 9 *)
  print_endline (string_of_int (ackermann 3 3));      (* 61 *)
  (* Warning: ackermann 4 1 is extremely large, may take time *)
  (* print_endline (string_of_int (ackermann 4 1));  (* 65533 *) *)
  print_endline "----- TEST DONE -----";
