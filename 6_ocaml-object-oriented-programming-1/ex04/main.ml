let () =
  Printf.printf "=== EX04: The Time War! ===\n\n";

  let p1 = new People.people "Alice" in
  let p2 = new People.people "Rory" in
  let p3 = new People.people "Clara" in

  let d1 = new Doctor.doctor "The Doctor" 1200 in
  let d2 = new Doctor.doctor "The War Doctor" 900 in

  let k1 = new Dalek.dalek "K1" in
  let k2 = new Dalek.dalek "K2" in
  let k3 = new Dalek.dalek "K3" in

  Printf.printf "\n--- Initial objects ---\n";
  Printf.printf "%s\n" p1#to_string;
  Printf.printf "%s\n" d1#to_string;
  Printf.printf "%s\n" k1#to_string;

  Printf.printf "\n--- Talk tests ---\n";
  p1#talk;
  d1#talk;
  k1#talk;

  let g = new Galifrey.galifrey [k1; k2; k3] [d1; d2] [p1; p2; p3] in
  g#do_time_war;

  Printf.printf "\n=== End of simulation ===\n"
