let print_value v =
  print_endline (
    Value.toStringVerbose v ^ " (" ^
    Value.toString v ^ ", " ^
    string_of_int (Value.toInt v) ^ ")"
  )

let () =
  print_endline "--- All values ---";
  List.iter print_value Value.all;

  print_endline "\n--- Next tests ---";
  print_endline (Value.toStringVerbose (Value.next Value.T9));
  print_endline (Value.toStringVerbose (Value.next Value.Queen));

  print_endline "\n--- Previous tests ---";
  print_endline (Value.toStringVerbose (Value.previous Value.King));
  print_endline (Value.toStringVerbose (Value.previous Value.T10));

  print_endline "\n--- Error test (expected crash) ---";
  try
    let _ = Value.next Value.As in
    ()
  with Invalid_argument s ->
    let () = print_endline ("Type of s is string") in
    print_endline ("Caught: " ^ s)
