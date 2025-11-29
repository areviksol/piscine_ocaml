let ft_rot_n n str =
  let rotate c =
    if c >= 'a' && c <= 'z' then
      char_of_int (((int_of_char c - int_of_char 'a' + n) mod 26) + int_of_char 'a')
    else if c >= 'A' && c <= 'Z' then
      char_of_int (((int_of_char c - int_of_char 'A' + n) mod 26) + int_of_char 'A')
    else
      c
  in
  String.map rotate str


let () =
  let test n s =
    let r = ft_rot_n n s in
    print_endline ("ROT " ^ string_of_int n ^ ": " ^ s ^ " -> " ^ r)
  in
  test 1 "abcdefghijklmnopqrstuvwxyz";
  test 13 "abcdefghijklmnopqrstuvwxyz";
  test 42 "0123456789";
  test 2 "OI2EAS67B9";
  test 0 "Damned !";
  test 42 "";
  test 1 "NBzlk qnbjr !"
