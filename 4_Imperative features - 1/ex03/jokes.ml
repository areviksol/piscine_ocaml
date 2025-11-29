(* jokes.ml *)

(* Seed the random number generator *)
let () = Random.self_init ()

(* Function to read all lines from a file into a string array *)
let read_jokes filename =
  let ic = open_in filename in
  let lines = ref [] in
  try
    while true do
      lines := input_line ic :: !lines
    done;
    [||] (* unreachable *)
  with End_of_file ->
    close_in ic;
    Array.of_list (List.rev !lines)

(* Main program *)
let () =
  if Array.length Sys.argv < 2 then
    prerr_endline "Usage: ./jokes <filename>"
  else
    let filename = Sys.argv.(1) in
    let jokes_array = read_jokes filename in
    if Array.length jokes_array = 0 then
      prerr_endline "No jokes found in the file."
    else
      let idx = Random.int (Array.length jokes_array) in
      print_endline jokes_array.(idx)
