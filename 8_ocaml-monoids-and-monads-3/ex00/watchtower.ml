module Watchtower =
struct
  type hour = int

  (* Zero is 12 on a 12-hour clock *)
  let zero : hour = 12

  let normalize h =
    let m = h mod 12 in
    if m = 0 then 12 else m

  let add (a : hour) (b : hour) : hour =
    normalize (a + b)

  let sub (a : hour) (b : hour) : hour =
    normalize (a - b)
end
