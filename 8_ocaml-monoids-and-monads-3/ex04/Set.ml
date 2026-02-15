type 'a t = 'a list

let rec nub lst =
  match lst with
  | [] -> []
  | x::xs -> x :: nub (List.filter (fun y -> y <> x) xs)

let return x = [x]

let bind s f =
  nub (List.flatten (List.map f s))

let union s1 s2 =
  nub (s1 @ s2)

let inter s1 s2 =
  List.filter (fun x -> List.mem x s2) s1 |> nub

let diff s1 s2 =
  List.filter (fun x -> not (List.mem x s2)) s1 |> nub

let filter s f =
  List.filter f s |> nub

let foreach s f =
  List.iter f s

let for_all s f =
  List.for_all f s

let exists s f =
  List.exists f s
