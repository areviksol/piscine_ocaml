
(* Function to compute the Euclidean distance between two points *)
let eu_dist (a : float array) (b : float array) : float =
  let n = Array.length a in
  let sum_sq = ref 0.0 in
  for i = 0 to n - 1 do
    let diff = a.(i) -. b.(i) in
    sum_sq := !sum_sq +. diff *. diff
  done;
  sqrt !sum_sq

(* Test program *)
let () =
  let p1 = [|0.0; 0.0|] in
  let p2 = [|3.0; 4.0|] in
  Printf.printf "eu_dist([0;0], [3;4]) = %f\n" (eu_dist p1 p2);

  let p3 = [|1.0; 2.0; 3.0|] in
  let p4 = [|4.0; 6.0; 8.0|] in
  Printf.printf "eu_dist([1;2;3], [4;6;8]) = %f\n" (eu_dist p3 p4);

  let p5 = [|0.0; 0.0; 0.0|] in
  let p6 = [|1.0; 1.0; 1.0|] in
  Printf.printf "eu_dist([0;0;0], [1;1;1]) = %f\n" (eu_dist p5 p6)
