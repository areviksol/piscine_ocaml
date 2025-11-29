module type MONOID =
sig
  type element
  val zero1 : element
  val zero2 : element
  val mul : element -> element -> element
  val add : element -> element -> element
  val div : element -> element -> element
  val sub : element -> element -> element
end

module INT : MONOID =
struct
  type element = int
  let zero1 = 0
  let zero2 = 1

  let add a b = a + b
  let sub a b = a - b
  let mul a b = a * b
  let div a b = a / b
end

module FLOAT : MONOID =
struct
  type element = float
  let zero1 = 0.0
  let zero2 = 1.0

  let add a b = a +. b
  let sub a b = a -. b
  let mul a b = a *. b
  let div a b = a /. b
end
