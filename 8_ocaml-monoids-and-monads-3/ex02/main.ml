module Calc_int = Calc(MONOID.INT)
module Calc_float = Calc(MONOID.FLOAT)

let () =
  Printf.printf "Testing INT monoid:\n";
  Printf.printf "3^3 = %d\n" (Calc_int.power 3 3);
  Printf.printf "(20 + 1) * 2 = %d\n"
    (Calc_int.mul (Calc_int.add 20 1) 2);
  Printf.printf "5! = %d\n" (Calc_int.fact 5);

  Printf.printf "\nTesting FLOAT monoid:\n";
  Printf.printf "3.0^3 = %f\n" (Calc_float.power 3.0 3);
  Printf.printf "(20.0 + 1.0) * 2.0 = %f\n"
    (Calc_float.mul (Calc_float.add 20.0 1.0) 2.0);
  Printf.printf "5.0! = %f\n" (Calc_float.fact 5.0);
