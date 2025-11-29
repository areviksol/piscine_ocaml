let rec ft_power x n =
  if n = 0 then 1
  else x * ft_power x (n - 1)

let () =
  let test x n =
    let result = ft_power x n in
    print_int result;
    print_char '\n'
  in
  test 2 4;
  test 3 0;
  test 0 5;
  test 5 3;
  test 1 10
