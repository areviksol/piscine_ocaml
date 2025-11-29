let print_card c =
  Printf.printf "%s -> %s\n" (Card.toString c) (Card.toStringVerbose c)

let () =
  (* Print all cards *)
  print_endline "--- All Cards ---";
  List.iter print_card Card.all;

  (* Test getValue and getColor *)
  print_endline "\n--- Test getValue and getColor ---";
  let c = Card.newCard Card.Value.King Card.Color.Heart in
  Printf.printf "Card: %s, Value: %s, Color: %s\n"
    (Card.toString c)
    (Card.Value.toStringVerbose (Card.getValue c))
    (Card.Color.toStringVerbose (Card.getColor c));

  (* Test compare, max, min *)
  print_endline "\n--- Test compare, max, min ---";
  let c1 = Card.newCard Card.Value.Queen Card.Color.Spade in
  let c2 = Card.newCard Card.Value.Jack Card.Color.Diamond in
  Printf.printf "compare %s %s = %d\n" (Card.toString c1) (Card.toString c2) (Card.compare c1 c2);
  Printf.printf "max: %s\n" (Card.toString (Card.max c1 c2));
  Printf.printf "min: %s\n" (Card.toString (Card.min c1 c2));

  (* Test best *)
  print_endline "\n--- Test best ---";
  let lst = [c2; c1; c] in
  Printf.printf "best: %s\n" (Card.toString (Card.best lst));

  (* Test isSpade, isHeart, isDiamond, isClub *)
  print_endline "\n--- Test is* functions ---";
  List.iter (fun card ->
    Printf.printf "%s: Spade=%b, Heart=%b, Diamond=%b, Club=%b\n"
      (Card.toString card)
      (Card.isSpade card)
      (Card.isHeart card)
      (Card.isDiamond card)
      (Card.isClub card)
  ) [c1; c2; c; Card.newCard Card.Value.T10 Card.Color.Club];
