let rec first_alive (lst : 'a list) (alive : 'a -> bool) : 'a option =
  match lst with
  | [] -> None
  | x :: xs -> if alive x then Some x else first_alive xs alive

let any_alive (lst : 'a list) (alive : 'a -> bool) : bool =
  match first_alive lst alive with
  | None -> false
  | Some _ -> true

class galifrey
  (daleks : Dalek.dalek list)
  (doctors : Doctor.doctor list)
  (people : People.people list)
= object (self)
  val daleks : Dalek.dalek list = daleks
  val doctors : Doctor.doctor list = doctors
  val people : People.people list = people

  method private print_status (round : int) : unit =
    let dalek_alive = List.filter (fun d -> d#is_alive) daleks in
    let doc_alive = List.filter (fun d -> d#is_alive) doctors in
    let ppl_alive = List.filter (fun p -> p#is_alive) people in
    Printf.printf "\n--- Round %d status ---\n" round;
    Printf.printf "Daleks alive: %d | Doctors alive: %d | People alive: %d\n"
      (List.length dalek_alive) (List.length doc_alive) (List.length ppl_alive)

  method private doctor_strike (doc : Doctor.doctor) (dalek : Dalek.dalek) : unit =
    if doc#is_alive then (
      Printf.printf "%s strikes Dalek for %d damage.\n"
        doc#to_string doc#attack_damage;
      dalek#take_damage doc#attack_damage
    )

  method private people_cheer (p : People.people) : unit =
    if p#is_alive then p#talk

  method do_time_war : unit =
    let max_rounds = 100 in

    let rec war (round : int) : unit =
      self#print_status round;

      let daleks_still = any_alive daleks (fun d -> d#is_alive) in
      let defenders_still =
        (any_alive doctors (fun d -> d#is_alive)) || (any_alive people (fun p -> p#is_alive))
      in

      if (not daleks_still) || (not defenders_still) || round > max_rounds then (
        Printf.printf "\n=== TIME WAR ENDS at round %d ===\n" round;
        if daleks_still && not defenders_still then
          Printf.printf "Daleks win. The universe trembles.\n"
        else if (not daleks_still) && defenders_still then
          Printf.printf "Gallifrey wins. Time is (mostly) safe.\n"
        else
          Printf.printf "Stalemate across the Time Vortex.\n"
      ) else (
        (* pick first alive dalek *)
        match first_alive daleks (fun d -> d#is_alive) with
        | None -> war (round + 1)
        | Some dk ->
          (* dalek targets a doctor if possible, else a person *)
          (match first_alive doctors (fun d -> d#is_alive) with
           | Some doc ->
             dk#attack (doc :> < take_damage : int -> unit; to_string : string; .. >)
           | None ->
             (match first_alive people (fun p -> p#is_alive) with
              | None -> ()
              | Some p ->
                dk#attack (p :> < take_damage : int -> unit; to_string : string; .. >)));

          (* first alive doctor retaliates if any *)
          (match first_alive doctors (fun d -> d#is_alive) with
           | None -> ()
           | Some doc2 -> self#doctor_strike doc2 dk);

          (* people cheer (prints, helps testing) *)
          (match first_alive people (fun p -> p#is_alive) with
           | None -> ()
           | Some p2 -> self#people_cheer p2);

          war (round + 1)
      )
    in
    Printf.printf "\n*** The Time War begins! ***\n";
    war 1
end
