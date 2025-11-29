let rec ft_string_all pred str =
  let len = String.length str in
  let rec loop i =
    if i >= len then true
    else if not (pred (String.get str i)) then false
    else loop (i + 1)
  in
  loop 0


let () =
  let test pred str =
    let result = ft_string_all pred str in
    print_endline (str ^ " -> " ^ (if result then "true" else "false"))
  in

  (* Predicate: is digit *)
  let is_digit c = c >= '0' && c <= '9' in

  test is_digit "0123456789";
  test is_digit "O12EAS67B9";
  test is_digit "";
  test is_digit "123abc456";

  (* Predicate: is lowercase letter *)
  let is_lower c = c >= 'a' && c <= 'z' in
  test is_lower "ocaml";
  test is_lower "OCaml";
  test is_lower ""
