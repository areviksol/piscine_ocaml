(* alkane_combustion.ml *)

class balanced_reaction (start : (Molecule.molecule * int) list)
                       (result : (Molecule.molecule * int) list) =
object
  inherit Reaction.reaction start result
  method balance = new balanced_reaction start result
  method is_balanced = true
  method get_start = start
  method get_result = result
end

class alkane_combustion (alkanes : Alkane.alkane list) =
object (self)
  inherit Reaction.reaction [] []

  method private total_atoms () =
    let rec sum (c,h) lst =
      match lst with
      | [] -> (c,h)
      | a::t ->
          let n_c = List.fold_left (fun acc at -> if at#symbol="C" then acc+1 else acc) 0 a#atoms in
          let n_h = List.fold_left (fun acc at -> if at#symbol="H" then acc+1 else acc) 0 a#atoms in
          sum (c+n_c, h+n_h) t
    in sum (0,0) alkanes

  (* Complete combustion *)
  method balance =
    let (total_c, total_h) = self#total_atoms () in
    let n_co2 = total_c in
    let n_h2o = total_h / 2 in
    let n_o2 = (2*n_co2 + n_h2o)/2 in
    let start = List.map (fun a -> (a,1)) alkanes @ [ (new Reaction.dioxygen, n_o2) ] in
    let result = [ (new Molecule.carbon_dioxide, n_co2); (new Molecule.water, n_h2o) ] in
    new balanced_reaction start result

  method is_balanced = false
  method get_start = failwith "Unbalanced reaction"
  method get_result = failwith "Unbalanced reaction"

  (* --------------------------- *)
  (*  Incomplete combustion results *)
  method get_incomplete_results : (int * (Molecule.molecule * int) list) list =
    let (total_c, total_h) = self#total_atoms () in
    let results = ref [] in
    (* Loop over possible oxygen amounts *)
    let max_oxygen = (2*total_c + total_h/2) in
    let rec loop o =
      if o < 1 then () else
      let n_o2 = o in
      (* compute CO2, CO, C, H2O counts approximately *)
      let n_h2o = total_h / 2 in
      let n_co2 = min total_c (n_o2*2 /2) in
      let remaining_c = total_c - n_co2 in
      let n_co = min remaining_c (n_o2 - n_co2) in
      let n_c = remaining_c - n_co in
      let _start = List.map (fun a -> (a,1)) alkanes @ [ (new Reaction.dioxygen, n_o2) ] in
      let result =
        [ (new Molecule.carbon_dioxide, n_co2);
          (new Molecule.carbon_monoxide, n_co);
          (new Molecule.carbon, n_c);
          (new Molecule.water, n_h2o) ] in
      results := (n_o2,result) :: !results;
      loop (o-1)
    in
    loop max_oxygen;
    List.rev !results
end
