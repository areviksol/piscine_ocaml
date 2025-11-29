(* examples_of_file.ml *)

(* Function to split a string by a character *)
let split_on_char sep s =
  let len = String.length s in
  let acc = ref [] in
  let start = ref 0 in
  for i = 0 to len - 1 do
    if s.[i] = sep then (
      acc := (String.sub s !start (i - !start)) :: !acc;
      start := i + 1
    )
  done;
  (* Add last element *)
  acc := (String.sub s !start (len - !start)) :: !acc;
  List.rev !acc

(* Function to read examples from a CSV file *)
let examples_of_file filename =
  let ic = open_in filename in
  let examples = ref [] in
  try
    while true do
      let line = input_line ic in
      let fields = split_on_char ',' line in
      let len = List.length fields in
      if len > 0 then
        let class_label = List.nth fields (len - 1) in
        let features =
          List.map float_of_string (List.rev (List.tl (List.rev fields)))
        in
        examples := (Array.of_list features, class_label) :: !examples
    done;
    [] (* unreachable *)
  with End_of_file ->
    close_in ic;
    List.rev !examples

(* Example usage *)
let () =
  let filename = if Array.length Sys.argv > 1 then Sys.argv.(1) else "ionosphere.test.csv" in
  let examples = examples_of_file filename in
  Printf.printf "Read %d examples from %s\n" (List.length examples) filename
