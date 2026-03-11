(* main.ml *)

let () =
  let alkanes = [new Alkane.ethane] in
  let reaction = new Alkane_combustion.alkane_combustion alkanes in

  print_endline "=== Incomplete Combustion Results ===";
  List.iter (fun (o2, lst) ->
    Printf.printf "\nOxygen: %d\n" o2;
    List.iter (fun (m,n) -> Printf.printf "%d × %s\n" n m#to_string) lst
  ) (reaction#get_incomplete_results)
