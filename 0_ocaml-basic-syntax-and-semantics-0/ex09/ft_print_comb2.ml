let ft_print_comb2 () =
  let rec print_digit n =
    if n < 10 then print_char (char_of_int (n + int_of_char '0'))
    else (
      print_char (char_of_int ((n / 10) + int_of_char '0'));
      print_char (char_of_int ((n mod 10) + int_of_char '0'))
    )
  in
  let rec loop a b =
    if a <= 98 then
      if b <= 99 then
        let () =
          print_digit a;
          print_char ' ';
          print_digit b;
          if not (a = 98 && b = 99) then print_char ','; 
          if not (a = 98 && b = 99) then print_char ' '
        in
        loop a (b + 1)
      else loop (a + 1) (a + 2)
  in
  loop 0 1;
  print_char '\n'


let () =
  ft_print_comb2 ();
  print_string "----- TEST DONE -----\n"
