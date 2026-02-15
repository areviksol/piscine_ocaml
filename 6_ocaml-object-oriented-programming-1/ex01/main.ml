let () =
  let amy = new People.people "Amy" in
  let rory = new People.people "Rory" in

  let doc1 = new Doctor.doctor "Eleven" 1100 amy in
  let doc2 = new Doctor.doctor "Twelve" 1200 rory in

  Printf.printf "doc1: %s\n" (doc1#to_string);
  Printf.printf "doc2: %s\n" (doc2#to_string);
  doc1#talk;
  doc2#talk;

  Printf.printf "doc1 uses sonic screwdriver:\n";
  doc1#use_sonic_screwdriver;

  Printf.printf "\nTravel forward test (no regeneration expected):\n";
  doc1#travel_in_time 2000 2050;
  Printf.printf "After forward travel: %s\n" (doc1#to_string);

  Printf.printf "\nDamage and regeneration test (backward travel triggers regenerate):\n";
  doc2#take_damage 60;
  Printf.printf "After damage doc2: %s\n" (doc2#to_string);
  doc2#travel_in_time 3000 2900;
  Printf.printf "After backward travel (should have regenerated): %s\n" (doc2#to_string);

  Printf.printf "\nSidekick interactions:\n";
  amy#talk;
  rory#talk;
  amy#take_damage 30;
  Printf.printf "Amy after damage: %s\n" (amy#to_string);

  Printf.printf "\nAll doctor methods tested. Ready for the peer defence.\n"
