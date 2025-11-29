(* Seed the random number generator *)
let () = Random.self_init ()

(* Array of bad jokes *)
let jokes = [|
  "Why did the scarecrow win an award? Because he was outstanding in his field!";
  "Why don't skeletons fight each other? They don't have the guts.";
  "I'm reading a book on anti-gravity. It's impossible to put down!";
  "Why did the tomato turn red? Because it saw the salad dressing!";
  "What do you call fake spaghetti? An impasta!"
|]

(* Pick a random joke and print it *)
let () =
  let idx = Random.int (Array.length jokes) in
  print_endline jokes.(idx)
