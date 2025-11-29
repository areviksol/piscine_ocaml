(* create several people to test everything *)
let () =
  (* Creation messages from initializer will be printed when objects are built *)
  let alice = new people "Alice" in
  let rory = new people "Rory" in
  let the_doctor = new people "The Doctor" in

  (* Test to_string for each object *)
  Printf.printf "to_string Alice: %s\n" (alice#to_string);
  Printf.printf "to_string Rory: %s\n" (rory#to_string);
  Printf.printf "to_string Doctor: %s\n" (the_doctor#to_string);

  (* Test talk method *)
  alice#talk;
  rory#talk;
  the_doctor#talk;

  (* Simulate an event that triggers die *)
  Printf.printf "A Weeping Angel appears! Someone must face it...\n";
  rory#die;

  (* More instances to prove initializer and methods consistently work *)
  let clara = new people "Clara" in
  Printf.printf "to_string Clara: %s\n" (clara#to_string);
  clara#talk;

  (* Final summary line for the defence output *)
  Printf.printf "All people methods tested. Ready for the Time Vortex.\n"
