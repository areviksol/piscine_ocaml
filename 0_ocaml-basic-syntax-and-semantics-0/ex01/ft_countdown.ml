let rec ft_countdown n =
  if n < 0 then
    begin
      print_int 0;
      print_char '\n'
    end
  else
    begin
      print_int n;
      print_char '\n';
      if n > 0 then ft_countdown (n - 1)
    end

let () =
  print_char '\n';
  print_char 'T'; print_char 'e'; print_char 's'; print_char 't'; print_char 's'; print_char ':'; print_char '\n';

  print_char '\n';
  print_char 'I'; print_char 'n'; print_char 'p'; print_char 'u'; print_char 't'; print_char ':'; print_char ' ';
  print_int 3; print_char '\n';
  ft_countdown 3;

  print_char '\n';
  print_char 'I'; print_char 'n'; print_char 'p'; print_char 'u'; print_char 't'; print_char ':'; print_char ' ';
  print_int 0; print_char '\n';
  ft_countdown 0;

  print_char '\n';
  print_char 'I'; print_char 'n'; print_char 'p'; print_char 'u'; print_char 't'; print_char ':'; print_char ' ';
  print_int (-1); print_char '\n';
  ft_countdown (-1)
