(* main.ml *)

let () =
  let module S = Set in

  let a = S.return 1 in
  let b = S.return 2 in
  let c = S.return 3 in

  let s1 = S.union a b in
  let s2 = S.union b c in
  let s3 = S.inter s1 s2 in
  let s4 = S.diff s1 s2 in

  Printf.printf "s1: "; S.foreach s1 (fun x -> Printf.printf "%d " x); print_endline "";
  Printf.printf "s2: "; S.foreach s2 (fun x -> Printf.printf "%d " x); print_endline "";
  Printf.printf "s3 (inter): "; S.foreach s3 (fun x -> Printf.printf "%d " x); print_endline "";
  Printf.printf "s4 (diff): "; S.foreach s4 (fun x -> Printf.printf "%d " x); print_endline "";

  let s5 = S.bind s1 (fun x -> S.return (x*10)) in
  Printf.printf "s5 (bind *10): "; S.foreach s5 (fun x -> Printf.printf "%d " x); print_endline "";

  let s6 = S.filter s5 (fun x -> x > 10) in
  Printf.printf "s6 (filter > 10): "; S.foreach s6 (fun x -> Printf.printf "%d " x); print_endline "";

  Printf.printf "for_all > 0 in s5: %b\n" (S.for_all s5 (fun x -> x > 0));
  Printf.printf "exists = 20 in s5: %b\n" (S.exists s5 (fun x -> x = 20));
