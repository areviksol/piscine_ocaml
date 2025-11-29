module Calc =
functor (M : MONOID) ->
struct
  let add = M.add
  let sub = M.sub
  let mul = M.mul
  let div = M.div

  let rec power x n =
    if n <= 0 then M.zero2
    else M.mul x (power x (n - 1))

  let rec fact x =
    if x = M.zero1 then M.zero2
    else M.mul x (fact (M.sub x M.zero2))
end
