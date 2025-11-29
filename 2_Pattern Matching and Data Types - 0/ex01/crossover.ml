(* ---------------- CROSSOVER (INTERSECTION) ---------------- *)
let crossover lst1 lst2 =
  let rec contains lst x =
    match lst with
    | [] -> false
    | hd :: tl -> hd = x || contains tl x
  in
  let rec aux l acc =
    match l with
    | [] -> acc
    | hd :: tl ->
        if contains lst2 hd then aux tl (hd :: acc)
        else aux tl acc
  in
  if lst1 = [] || lst2 = [] then []
  else List.rev (aux lst1 [])

(* ---------------- GENERIC PRINT LIST ---------------- *)
let print_list printer lst =
  let rec loop l =
    match l with
    | [] -> ()
    | hd :: tl ->
        printer hd;
        print_string " ";
        loop tl
  in
  loop lst;
  print_newline ()

(* ---------------- EXAMPLE PRINTERS ---------------- *)
let print_int_value i = print_int i
let print_string_value s = print_string ("\"" ^ s ^ "\"")
let print_int_tuple (a,b) =
  print_string "(";
  print_int a;
  print_string ", ";
  print_int b;
  print_string ")"

(* ---------------- TEST SUITE ---------------- *)
let () =
  (* Integers *)
  print_list print_int_value (crossover [] [1;2;3]);
  print_list print_int_value (crossover [1;2;3] []);
  print_list print_int_value (crossover [1;2;3] [2;3;4]);
  print_list print_int_value (crossover [5;4;3;2] [7;2;1]);
  print_list print_int_value (crossover [1;1;1] [1]);

  (* Strings *)
  print_list print_string_value (crossover ["tototo";"tototo";"fufufu"] ["tototo";"tototo";"tototo"]);
  print_list print_string_value (crossover ["a";"b";"c"] ["b";"c";"d"]);

  (* Tuples of ints *)
  print_list print_int_tuple (crossover [(3,2); (3,2); (4,3)] [(3,2); (4,3)]);
