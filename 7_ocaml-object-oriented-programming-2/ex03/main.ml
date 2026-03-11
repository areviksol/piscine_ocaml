let () =
  let r = new Reaction.methane_combustion in

  let print_side side =
    List.iter
      (fun (m, n) ->
        print_endline (string_of_int n ^ " × " ^ m#to_string))
      side
  in

  print_endline "Start:";
  print_side r#get_start;

  print_endline "Result:";
  print_side r#get_result;

  print_endline ("Balanced: " ^ string_of_bool r#is_balanced)
