let repeat_string ?(str="x") n =
  let rec build count acc =
    if count <= 0 then acc
    else build (count - 1) (str ^ acc)
  in
  if n < 0 then "Error"
  else build n ""


let () =
  print_endline (repeat_string ~str:"Toto" 1);   (* Toto *)
  print_endline (repeat_string 2);               (* xx *)
  print_endline (repeat_string ~str:"a" 5);      (* aaaaa *)
  print_endline (repeat_string ~str:"what" 3);   (* whatwhatwhat *)
  print_endline (repeat_string 0);               (* "" *)
  print_endline (repeat_string (-1));            (* Error *)
  print_endline (repeat_string 4);                 (* xxxx *)
  print_endline (repeat_string ~str:"Toto" 0);

