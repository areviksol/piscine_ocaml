let ft_print_alphabet () =
  let rec loop c =
    print_char (char_of_int c);
    if c < int_of_char 'z' then
      loop (c + 1)
  in
  loop (int_of_char 'a');
  print_char '\n'


let () =
  print_char '\n';
  ft_print_alphabet ();
