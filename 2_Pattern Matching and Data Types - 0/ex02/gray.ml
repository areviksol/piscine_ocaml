let gray n =
  let rec generate k =
    if k = 0 then [""]        (* Base = list with empty string *)
    else
      let prev = generate (k - 1) in
      let rec reverse lst =
        if lst = [] then [] else reverse (List.tl lst) @ [List.hd lst]
      in
      let rec prefix lst bit =
        match lst with
        | [] -> []
        | h :: t -> String.concat "" [bit; h] :: prefix t bit
      in
      (prefix prev "0") @ (prefix (reverse prev) "1")
  in

  let rec print_list lst =
    match lst with
    | [] -> print_newline ()
    | h :: t ->
        print_string h;
        if t <> [] then print_string " ";
        print_list t
  in

  if n < 0 then print_newline ()
  else print_list (generate n)


let () =
  gray 1;      (* 0 1 *)
  gray 2;      (* 00 01 11 10 *)
  gray 3;      (* 000 001 011 010 110 111 101 100 *)
  gray 4       (* more tests *)
