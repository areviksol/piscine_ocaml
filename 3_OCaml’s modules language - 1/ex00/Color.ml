type t = Spade | Heart | Diamond | Club

let all = [Spade; Heart; Diamond; Club]

let toString c =
  if c = Spade then "S"
  else if c = Heart then "H"
  else if c = Diamond then "D"
  else "C"

let toStringVerbose c =
  if c = Spade then "Spade"
  else if c = Heart then "Heart"
  else if c = Diamond then "Diamond"
  else "Club"
