let () =
  let alkanes = [new Alkane.methane; new Alkane.ethane] in
  let reaction = new Alkane_combustion.alkane_combustion alkanes in
  let balanced = reaction#balance in

  let print_side side =
    List.iter (fun (m,n) ->
      print_endline (string_of_int n ^ " × " ^ m#to_string)
    ) side
  in

  print_endline "=== Alkane Combustion ===";
  print_endline "\nStart:";
  print_side balanced#get_start;

  print_endline "\nResult:";
  print_side balanced#get_result;

  print_endline ("\nBalanced: " ^ string_of_bool balanced#is_balanced)
