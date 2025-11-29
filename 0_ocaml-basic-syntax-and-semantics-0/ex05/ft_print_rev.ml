let ft_print_rev str =
  let rec loop i =
    if i >= 0 then
      let () = print_char (String.get str i) in
      loop (i - 1)
  in
  loop (String.length str - 1);
  print_char '\n'


let () =
  ft_print_rev "Hello world !\n";
  ft_print_rev "";
  ft_print_rev "OCaml piscine 2025!";
  ft_print_rev "a";
  ft_print_rev "racecar"
