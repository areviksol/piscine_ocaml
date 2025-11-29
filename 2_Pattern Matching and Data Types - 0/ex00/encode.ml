(* ---------------- RUN-LENGTH ENCODING ---------------- *)
let encode lst =
  let rec aux count acc = function
    | [] -> List.rev acc
    | [x] -> List.rev ((count + 1, x) :: acc)
    | a :: b :: tl ->
        if a = b then aux (count + 1) acc (b :: tl)
        else aux 0 ((count + 1, a) :: acc) (b :: tl)
  in
  aux 0 [] lst

(* ---------------- GENERIC PRINT FUNCTION ---------------- *)
let print_any printer x =
  printer x;
  print_newline ()

(* ---------------- PRINT LIST OF (COUNT, ELEMENT) ---------------- *)
let print_tuple_list printer lst =
  let rec loop = function
    | [] -> print_newline ()
    | (count, e) :: tl ->
        print_string "(";
        print_int count;
        print_string ", ";
        printer e;
        print_string ") ";
        loop tl
  in
  loop lst

(* ---------------- EXAMPLE PRINTERS ---------------- *)

(* Printer for int *)
let print_int_value = print_int

(* Printer for string *)
let print_string_value s = print_string ("\"" ^ s ^ "\"")

(* Printer for tuple of two ints *)
let print_int_tuple (a,b) =
  print_string "(";
  print_int a;
  print_string ", ";
  print_int b;
  print_string ")"

(* Printer for tuple of (string * int) *)
let print_string_int_tuple (s,i) =
  print_string "(";
  print_string ("\"" ^ s ^ "\"");
  print_string ", ";
  print_int i;
  print_string ")"

(* ---------------- TEST SUITE ---------------- *)
let () =
  (* Strings *)
  print_tuple_list print_string_value (encode ["a";"a";"b";"b";"b";"c"]);
  print_tuple_list print_string_value (encode ["x"]);
  print_tuple_list print_string_value (encode ["z";"z";"z"]);
  print_tuple_list print_string_value (encode ["a";"b";"c"]);
  print_tuple_list print_string_value (encode ["hello";"hello";"yo"]);

  (* Ints *)
  print_tuple_list print_int_value (encode [1;1;2;2;2;3]);

  (* Tuples of ints *)
  print_tuple_list print_int_tuple (encode [(3,2); (3,2); (4,3)]);

  (* Tuples of string * int *)
  print_tuple_list print_string_int_tuple (encode [("a",1);("a",1);("b",2)])
