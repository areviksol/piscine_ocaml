let () =
  let module W = Watchtower in

  Printf.printf "Zero = %d\n" W.zero;

  (* Addition tests *)
  Printf.printf "3 + 4 = %d\n" (W.add 3 4);
  Printf.printf "11 + 2 = %d\n" (W.add 11 2);
  Printf.printf "12 + 12 = %d\n" (W.add 12 12);
  Printf.printf "5 + 20 = %d\n" (W.add 5 20);

  (* Subtraction tests *)
  Printf.printf "7 - 3 = %d\n" (W.sub 7 3);
  Printf.printf "3 - 7 = %d\n" (W.sub 3 7);
  Printf.printf "12 - 12 = %d\n" (W.sub 12 12);
  Printf.printf "1 - 20 = %d\n" (W.sub 1 20);

  (* Extra: show all 12 positions by adding 1 repeatedly *)
  let rec loop h n =
    if n = 0 then ()
    else (
      Printf.printf "Add 1: %d\n" (W.add h 1);
      loop (W.add h 1) (n - 1)
    )
  in

  loop W.zero 12
