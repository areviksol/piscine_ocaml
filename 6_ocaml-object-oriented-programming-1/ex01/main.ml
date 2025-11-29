let () =
  (* Create people sidekicks *)
  let amy = new people "Amy" in
  let rory = new people "Rory" in

  (* Create doctors with sidekicks *)
  let doc1 = new doctor "Eleven" 1100 amy in
  let doc2 = new doctor "Twelve" 1200 rory in

  (* Basic to_string and talk tests *)
  Printf.printf "doc1: %s\n" (doc1#to_string);
  Printf.printf "doc2: %s\n" (doc2#to_string);
  doc1#talk;
  doc2#talk;

  (* Sonic screwdriver test *)
  Printf.printf "doc1 uses sonic screwdriver:\n";
  doc1#use_sonic_screwdriver;

  (* Test travel forward in time *)
  Printf.printf "\nTravel forward test (no regeneration expected):\n";
  doc1#travel_in_time 2000 2050;
  Printf.printf "After forward travel: %s\n" (doc1#to_string);

  (* Damage the doctor and show hp decreased *)
  Printf.printf "\nDamage and regeneration test (backward travel triggers regenerate):\n";
  doc2#take_damage 60;
  Printf.printf "After damage doc2: %s\n" (doc2#to_string);
  (* Now travel backward; this will call private regenerate inside travel_in_time *)
  doc2#travel_in_time 3000 2900;
  Printf.printf "After backward travel (should have regenerated): %s\n" (doc2#to_string);

  (* Sidekicks talk and can be damaged too *)
  Printf.printf "\nSidekick interactions:\n";
  amy#talk;
  rory#talk;
  amy#take_damage 30;
  Printf.printf "Amy after damage: %s\n" (amy#to_string);

  (* Final summary for defence output *)
  Printf.printf "\nAll doctor methods tested. Ready for the peer defence.\n"
