let print_proj (p : App.project) =
  let (name, status, grade) = p in
  Printf.printf "Project(name='%s', status='%s', grade=%d)\n"
    name status grade

let () =
  let module A = App in

  Printf.printf "Zero project:\n";
  print_proj A.zero;

  let p1 = ("Alpha", "succeed", 90) in
  let p2 = ("Beta", "failed", 40) in

  Printf.printf "\nCombine p1 and p2:\n";
  print_proj (A.combine p1 p2);

  Printf.printf "\nFail p1:\n";
  print_proj (A.fail p1);

  Printf.printf "\nSuccess p2:\n";
  print_proj (A.success p2);

  Printf.printf "\nMore tests – combine with zero:\n";
  print_proj (A.combine p1 A.zero);
  print_proj (A.combine A.zero p1);

  Printf.printf "\nEdge grade tests:\n";
  let high = ("Hi", "succeed", 100) in
  let low = ("Lo", "failed", 0) in
  print_proj (A.combine high low);
