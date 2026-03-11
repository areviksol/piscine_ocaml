let () =
  let alice = new People.people "Alice" in
  let rory = new People.people "Rory" in
  let the_doctor = new People.people "The Doctor" in

  Printf.printf "to_string Alice: %s\n" (alice#to_string);
  Printf.printf "to_string Rory: %s\n" (rory#to_string);
  Printf.printf "to_string Doctor: %s\n" (the_doctor#to_string);

  alice#talk;
  rory#talk;
  the_doctor#talk;

  Printf.printf "A Weeping Angel appears! Someone must face it...\n";
  rory#die;

  let clara = new People.people "Clara" in
  Printf.printf "to_string Clara: %s\n" (clara#to_string);
  clara#talk;

  (* Final summary line for the defence output *)
  Printf.printf "All people methods tested. Ready for the Time Vortex.\n"
