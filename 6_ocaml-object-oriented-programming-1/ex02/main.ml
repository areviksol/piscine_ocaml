let () =
  Random.self_init ();

  (* Create humans (people) *)
  let amy = new people "Amy" in
  let rory = new people "Rory" in

  (* Create a doctor with Amy as sidekick *)
  let the_doc = new doctor "Tenth" 900 amy in

  (* Create a dalek *)
  let d = new dalek () in

  (* Show initial states *)
  Printf.printf "\nInitial states:\n";
  Printf.printf "Doctor: %s\n" (the_doc#to_string);
  Printf.printf "Dalek: %s\n" (d#to_string);
  Printf.printf "Amy: %s\n" (amy#to_string);
  Printf.printf "Rory: %s\n" (rory#to_string);

  (* Dalek speaks *)
  Printf.printf "\nThe Dalek speaks:\n";
  d#talk;

  (* Dalek attacks Amy *)
  Printf.printf "\nBattle: Dalek attacks Amy\n";
  d#exterminate amy;
  Printf.printf "Amy after attack: %s\n" (amy#to_string);
  Printf.printf "Dalek after attack (shield toggled): %s\n" (d#to_string);

  (* Dalek attacks Rory *)
  Printf.printf "\nBattle: Dalek attacks Rory\n";
  d#talk;
  d#exterminate rory;
  Printf.printf "Rory after attack: %s\n" (rory#to_string);
  Printf.printf "Dalek after second attack (shield toggled again): %s\n" (d#to_string);

  (* Doctor uses sonic screwdriver *)
  Printf.printf "\nThe Doctor acts:\n";
  the_doc#use_sonic_screwdriver;

  (* Doctor travels in time forward *)
  Printf.printf "\nDoctor travels forward in time:\n";
  the_doc#travel_in_time 2020 2120;
  Printf.printf "Doctor now: %s\n" (the_doc#to_string);

  (* Doctor takes damage and then travels backward to trigger regenerate *)
  Printf.printf "\nDoctor takes damage then travels backward to regenerate:\n";
  the_doc#take_damage 80;
  Printf.printf "After damage: %s\n" (the_doc#to_string);
  the_doc#travel_in_time 2120 2000; (* backward -> triggers regeneration inside travel_in_time *)
  Printf.printf "After backward travel: %s\n" (the_doc#to_string);

  (* Dalek dies (simulate final blow) *)
  Printf.printf "\nDalek final fate:\n";
  d#die;
  Printf.printf "Dalek now: %s\n" (d#to_string);

  Printf.printf "\nSimulation complete. All actions printed above are testable for defence.\n"
