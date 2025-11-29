module type FRACTIONNAL_BITS = sig
  val bits : int
end

module type FIXED = sig
  type t
  val of_float : float -> t
  val of_int : int -> t
  val to_float : t -> float
  val to_int : t -> int
  val to_string : t -> string
  val zero : t
  val one : t
  val succ : t -> t
  val pred : t -> t
  val min : t -> t -> t
  val max : t -> t -> t
  val gth : t -> t -> bool
  val lth : t -> t -> bool
  val gte : t -> t -> bool
  val lte : t -> t -> bool
  val eqp : t -> t -> bool
  val eqs : t -> t -> bool
  val add : t -> t -> t
  val sub : t -> t -> t
  val mul : t -> t -> t
  val div : t -> t -> t
  val foreach : t -> t -> (t -> unit) -> unit
end

module Make (F : FRACTIONNAL_BITS) : FIXED = struct
  type t = int

  let scale = 1 lsl F.bits         (* 2^bits *)
  let half = scale / 2

  let of_int i = i * scale

  let of_float f =
    let x = f *. float_of_int scale in
    if x >= 0. then int_of_float (x +. 0.5)
    else int_of_float (x -. 0.5)

  let to_int n = n / scale
  let to_float n = (float_of_int n) /. float_of_int scale

  let to_string n =
    let s = to_float n in
    let str = string_of_float s in
    if Stdlib.String.length str > 0 &&
       Stdlib.String.get str (Stdlib.String.length str - 1) = '.' then
      str ^ "0"
    else str

  let zero = 0
  let one = scale

  let succ n = n + 1
  let pred n = n - 1

  let min a b = if a <= b then a else b
  let max a b = if a >= b then a else b

  let gth a b = a > b
  let lth a b = a < b
  let gte a b = a >= b
  let lte a b = a <= b

  let eqp a b = a == b
  let eqs a b = a = b

  let add a b = a + b
  let sub a b = a - b

  let mul a b =
    let prod = a * b in
    (prod + half) / scale

  let div a b =
    let num = a * scale in
    if a >= 0 then (num + (b / 2)) / b
    else (num - (b / 2)) / b

  let rec foreach a b f =
    if a > b then ()
    else (
      f a;
      foreach (succ a) b f
    )
end

(* Instances *)
module Fixed4 : FIXED = Make (struct let bits = 4 end)
module Fixed8 : FIXED = Make (struct let bits = 8 end)

(* Required test *)
let () =
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);

  Fixed4.foreach Fixed4.zero Fixed4.one
    (fun f -> print_endline (Fixed4.to_string f));

  (* ADDITIONAL TESTS (required by subject) *)

  let a = Fixed4.of_int 2 in
  let b = Fixed4.of_float 2.5 in

  print_endline ("a = " ^ Fixed4.to_string a);
  print_endline ("b = " ^ Fixed4.to_string b);
  print_endline ("a + b = " ^ Fixed4.to_string (Fixed4.add a b));
  print_endline ("a - b = " ^ Fixed4.to_string (Fixed4.sub a b));
  print_endline ("a * b = " ^ Fixed4.to_string (Fixed4.mul a b));
  print_endline ("b / a = " ^ Fixed4.to_string (Fixed4.div b a));

  print_endline ("min(a,b) = " ^ Fixed4.to_string (Fixed4.min a b));
  print_endline ("max(a,b) = " ^ Fixed4.to_string (Fixed4.max a b));

  print_endline ("a > b : " ^ (if Fixed4.gth a b then "true" else "false"));
  print_endline ("a < b : " ^ (if Fixed4.lth a b then "true" else "false"));
  print_endline ("a >= b : " ^ (if Fixed4.gte a b then "true" else "false"));
  print_endline ("a <= b : " ^ (if Fixed4.lte a b then "true" else "false"));

  let x = Fixed4.of_int 3 in
  print_endline ("succ(3) = " ^ Fixed4.to_string (Fixed4.succ x));
  print_endline ("pred(3) = " ^ Fixed4.to_string (Fixed4.pred x));

  print_endline ("eqp(a,a) = " ^ (if Fixed4.eqp a a then "true" else "false"));
  print_endline ("eqs(a,a) = " ^ (if Fixed4.eqs a a then "true" else "false"))
