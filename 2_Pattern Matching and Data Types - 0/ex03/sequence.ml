let sequence n =
  let rec next s =
    let rec aux i count curr =
      if i >= String.length s then
        (string_of_int count) ^ String.make 1 curr
      else if s.[i] = curr then
        aux (i + 1) (count + 1) curr
      else
        (string_of_int count) ^ String.make 1 curr ^
        aux (i + 1) 1 s.[i]
    in
    aux 1 1 s.[0]
  in

  let rec build k current =
    if k = n then current
    else build (k + 1) (next current)
  in

  if n < 1 then ""
  else build 1 "1"


let () =
  print_endline (sequence (-1));   (* "" *)
  print_endline (sequence 1);      (* 1 *)
  print_endline (sequence 2);      (* 11 *)
  print_endline (sequence 3);      (* 21 *)
  print_endline (sequence 4);      (* 1211 *)
  print_endline (sequence 5);      (* 111221 *)
  print_endline (sequence 6);      (* 312211 *)
  print_endline (sequence 7);      (* 13112221 *)
  print_endline (sequence 10)      (* proof for deeper recursion *)
