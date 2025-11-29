module StringHashtbl = Hashtbl.Make(struct
  type t = string
  let equal = (=)
  let hash s =
    let h = ref 0 in
    for i = 0 to String.length s - 1 do
      h := !h * 31 + Char.code (String.get s i)
    done;
    !h
end)

let () =
  let ht = StringHashtbl.create 5 in
  let values = ["Hello"; "world"; "42"; "Ocaml"; "H"] in
  List.iter (fun s -> StringHashtbl.add ht s (String.length s)) values;
  StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht
