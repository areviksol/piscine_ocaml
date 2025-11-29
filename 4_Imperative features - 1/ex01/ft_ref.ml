(* Define a custom reference type *)
type 'a ft_ref = { mutable contents : 'a }

(* Create a new reference *)
let return x = { contents = x }

(* Dereference *)
let get r = r.contents

(* Assign *)
let set r x = r.contents <- x

(* Bind: apply a function to the reference's value to produce a new reference *)
let bind r f = f (get r)

(* Test examples *)
let () =
  let r = return 42 in
  Printf.printf "Initial: %d\n" (get r);

  set r 99;
  Printf.printf "After set: %d\n" (get r);

  let r2 = bind r (fun x -> return (x + 1)) in
  Printf.printf "After bind: %d\n" (get r2)
