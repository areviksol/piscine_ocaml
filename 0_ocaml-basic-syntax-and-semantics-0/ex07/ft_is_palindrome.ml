let ft_is_palindrome str =
  let len = String.length str in
  let rec check i j =
    if i >= j then true
    else if String.get str i <> String.get str j then false
    else check (i + 1) (j - 1)
  in
  check 0 (len - 1)


let () =
  let test s =
    let result = ft_is_palindrome s in
    print_endline (s ^ " -> " ^ (if result then "true" else "false"))
  in
  test "radar";
  test "madam";
  test "car";
  test "";
  test "a";
  test "ab";
  test "abba";
  test "abcba"
