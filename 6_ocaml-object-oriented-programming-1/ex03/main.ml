let print_count (label : string) (n : int) : unit =
  Printf.printf "%s members: %d\n" label n

let () =
  let p1 = new People.people "Amy" in
  let p2 = new People.people "Rory" in
  let pa0 = new Army.army ([] : People.people list) in
  let pa1 = pa0#add p1 in
  let pa2 = pa1#add p2 in
  print_count "People army after adds" (List.length pa2#members);
  let pa3 = pa2#delete in
  print_count "People army after delete" (List.length pa3#members);

  let d1 = new Dalek.dalek in
  let d2 = new Dalek.dalek in
  let da0 = new Army.army ([] : Dalek.dalek list) in
  let da1 = da0#add d1 in
  let da2 = da1#add d2 in
  print_count "Dalek army after adds" (List.length da2#members);
  let da3 = da2#delete in
  print_count "Dalek army after delete" (List.length da3#members);

  let sidekick = new People.people "Clara" in
  let doc1 = new Doctor.doctor "Eleven" 1100 sidekick in
  let doc2 = new Doctor.doctor "Twelve" 1200 sidekick in
  let doa0 = new Army.army ([] : Doctor.doctor list) in
  let doa1 = doa0#add doc1 in
  let doa2 = doa1#add doc2 in
  print_count "Doctor army after adds" (List.length doa2#members);
  let doa3 = doa2#delete in
  print_count "Doctor army after delete" (List.length doa3#members);

  Printf.printf "All armies tested. Geronimo!\n"
