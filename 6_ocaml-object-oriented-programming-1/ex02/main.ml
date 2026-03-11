let () =
  Random.self_init ();

  let amy = new People.people "Amy" in
  let rory = new People.people "Rory" in

  let the_doc = new Doctor.doctor "Tenth" 900 amy in

  let d = new Dalek.dalek () in

  Printf.printf "\nInitial states:\n";
  Printf.printf "Doctor: %s\n" (the_doc#to_string);
  Printf.printf "Dalek: %s\n" (d#to_string);
  Printf.printf "Amy: %s\n" (amy#to_string);
  Printf.printf "Rory: %s\n" (rory#to_string);

  Printf.printf "\nThe Dalek speaks:\n";
  d#talk;

  Printf.printf "\nBattle: Dalek attacks Amy\n";
  d#exterminate amy;
  Printf.printf "Amy after attack: %s\n" (amy#to_string);
  Printf.printf "Dalek after attack (shield toggled): %s\n" (d#to_string);

  Printf.printf "\nBattle: Dalek attacks Rory\n";
  d#talk;
  d#exterminate rory;
  Printf.printf "Rory after attack: %s\n" (rory#to_string);
  Printf.printf "Dalek after second attack (shield toggled again): %s\n" (d#to_string);

  Printf.printf "\nThe Doctor acts:\n";
  the_doc#use_sonic_screwdriver;

  Printf.printf "\nDoctor travels forward in time:\n";
  the_doc#travel_in_time 2020 2120;
  Printf.printf "Doctor now: %s\n" (the_doc#to_string);

  Printf.printf "\nDoctor takes damage then travels backward to regenerate:\n";
  the_doc#take_damage 80;
  Printf.printf "After damage: %s\n" (the_doc#to_string);
  the_doc#travel_in_time 2120 2000; (* backward -> triggers regeneration inside travel_in_time *)
  Printf.printf "After backward travel: %s\n" (the_doc#to_string);

  Printf.printf "\nDalek final fate:\n";
  d#die;
  Printf.printf "Dalek now: %s\n" (d#to_string);

  Printf.printf "\nSimulation complete. All actions printed above are testable for defence.\n"
