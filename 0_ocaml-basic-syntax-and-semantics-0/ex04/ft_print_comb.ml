let ft_print_comb () =
  let rec loop x y z =
    if x <= 7 then
      if y <= 8 then
        if z <= 9 then
          let () =
            print_int x;
            print_int y;
            print_int z;
            if not (x = 7 && y = 8 && z = 9) then
              print_string ", "
          in
          loop x y (z + 1)
        else loop x (y + 1) (y + 2)
      else loop (x + 1) (x + 2) (x + 3)
  in
  loop 0 1 2;
  print_string "\n"


let () =
  ft_print_comb ();
  print_string "----- TEST DONE -----\n"
