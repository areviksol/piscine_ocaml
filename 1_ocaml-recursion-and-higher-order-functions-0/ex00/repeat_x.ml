let repeat_x n =
  let rec build count acc =
    if count <= 0 then acc
    else build (count - 1) ("x" ^ acc)
  in
  if n < 0 then "Error"
  else build n ""


let () =
  print_endline (repeat_x (-1));  (* Error *)
  print_endline (repeat_x 0);     (* "" *)
  print_endline (repeat_x 1);     (* "x" *)
  print_endline (repeat_x 2);     (* "xx" *)
  print_endline (repeat_x 5);     (* "xxxxx" *)
  print_endline (repeat_x 10);    (* "xxxxxxxxxx" *)
  print_endline (repeat_x 20)     (* "xxxxxxxxxxxxxxxxxxxx" *)
