module App =
struct
  type project = string * string * int

  let zero = ("", "", 0)

  let average a b =
    (a + b) / 2

  let build_proj (name : string) (status : string) (grade : int) : project =
    (name, status, grade)

  let combine (p1 : project) (p2 : project) : project =
    let (n1, _, g1) = p1 in
    let (n2, _, g2) = p2 in
    let name = n1 ^ n2 in
    let avg = average g1 g2 in
    let status =
      if avg > 80 then "succeed" else "failed"
    in
    (name, status, avg)

  let fail (p : project) : project =
    let (n, _, _) = p in
    (n, "failed", 0)

  let success (p : project) : project =
    let (n, _, _) = p in
    (n, "succeed", 80)
end
