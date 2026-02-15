(* Set.ml *)

type 'a t = 'a list

(* Helper: remove duplicates *)
let rec nub lst =
  match lst with
  | [] -> []
  | x::xs -> x :: nub (List.filter (fun y -> y <> x) xs)

(* Return a singleton set *)
let return x = [x]

(* Bind / flat_map *)
let bind s f =
  nub (List.flatten (List.map f s))

(* Union of two sets *)
let union s1 s2 =
  nub (s1 @ s2)

(* Intersection *)
let inter s1 s2 =
  List.filter (fun x -> List.mem x s2) s1 |> nub

(* Difference: s1 \ s2 *)
let diff s1 s2 =
  List.filter (fun x -> not (List.mem x s2)) s1 |> nub

(* Filter *)
let filter s f =
  List.filter f s |> nub

(* foreach *)
let foreach s f =
  List.iter f s

(* for_all *)
let for_all s f =
  List.for_all f s

(* exists *)
let exists s f =
  List.exists f s
