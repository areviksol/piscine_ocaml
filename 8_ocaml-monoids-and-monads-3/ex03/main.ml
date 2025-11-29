let () =
  let module T = Try in

  Printf.printf "Testing return:\n";
  let s1 = T.return 10 in
  (match s1 with
  | T.Success v -> Printf.printf "Success: %d\n" v
  | T.Failure _ -> Printf.printf "Failure\n");

  Printf.printf "\nTesting bind:\n";
  let f x = if x mod 2 = 0 then T.Success (x / 2) else failwith "Odd number" in
  let r1 = T.bind s1 f in
  (match r1 with
  | T.Success v -> Printf.printf "Bind Success: %d\n" v
  | T.Failure e -> Printf.printf "Bind Failure: %s\n" (Printexc.to_string e));

  Printf.printf "\nTesting recover:\n";
  let r2 = T.recover r1 (fun _ -> T.Success 42) in
  (match r2 with
  | T.Success v -> Printf.printf "Recovered Success: %d\n" v
  | T.Failure e -> Printf.printf "Recovered Failure: %s\n" (Printexc.to_string e));

  Printf.printf "\nTesting filter:\n";
  let r3 = T.filter s1 (fun x -> x > 5) in
  (match r3 with
  | T.Success v -> Printf.printf "Filter Success: %d\n" v
  | T.Failure e -> Printf.printf "Filter Failure: %s\n" (Printexc.to_string e));

  let r4 = T.filter s1 (fun x -> x > 50) in
  (match r4 with
  | T.Success v -> Printf.printf "Filter Success: %d\n" v
  | T.Failure e -> Printf.printf "Filter Failure: %s\n" (Printexc.to_string e));

  Printf.printf "\nTesting flatten:\n";
  let nested = T.Success (T.Success 99) in
  let flat = T.flatten nested in
  (match flat with
  | T.Success v -> Printf.printf "Flatten Success: %d\n" v
  | T.Failure e -> Printf.printf "Flatten Failure: %s\n" (Printexc.to_string e));

  let nested_fail = T.Success (T.Failure (Failure "inner fail")) in
  let flat_fail = T.flatten nested_fail in
  (match flat_fail with
  | T.Success v -> Printf.printf "Flatten Success: %d\n" v
  | T.Failure e -> Printf.printf "Flatten Failure: %s\n" (Printexc.to_string e))
