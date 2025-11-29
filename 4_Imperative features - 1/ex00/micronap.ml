(* ocamlopt unix.cmxa micronap.ml -o micronap *)

(* Sleep function for 1 second *)
let my_sleep () = Unix.sleep 1

let () =
  (* Get command-line arguments *)
  let args = Sys.argv in
  (* Check if there is a second argument *)
  if Array.length args < 2 then
    ()  (* No argument -> exit immediately *)
  else
    try
      (* Try to parse the argument as an integer *)
      let n = int_of_string args.(1) in
      (* Only sleep if n is positive *)
      if n > 0 then
        for _ = 1 to n do
          my_sleep ()
        done
    with
      | Failure _ -> ()  (* Invalid integer -> exit immediately *)
