(* Function to add two floating-point numbers *)
let sum (a : float) (b : float) : float =
  a +. b

(* Test program *)
let () =
  let a = 3.5 in
  let b = 2.7 in
  let c = sum a b in
  print_endline ("sum(" ^ string_of_float a ^ ", " ^ string_of_float b ^ ") = " ^ string_of_float c);

  (* Additional tests *)
  print_endline ("sum(0.0, 0.0) = " ^ string_of_float (sum 0.0 0.0));
  print_endline ("sum(-1.5, 4.0) = " ^ string_of_float (sum (-1.5) 4.0));
  print_endline ("sum(1e10, 2.5) = " ^ string_of_float (sum 1e10 2.5))
