(defrule print-family-info   
   (parent-of (parent ?f) (child ?c) (type father))
   (parent-of (parent ?m) (child ?c) (type mother))
   (parents-of (father ?f) (mother ?m) (child ?c))
   
   (person (name ?f) (gender male) (role father))
   (person (name ?m) (gender female) (role mother))
   (person (name ?c) (gender male) (role son))
   =>

   (printout t "1. The father of " ?c " is " ?f "." crlf)
   (printout t "2. The mother of " ?c " is " ?m "." crlf)
   (printout t "3. The parents of " ?c " are " ?f " and " ?m "." crlf)
   (printout t "4. " ?f " is a father." crlf)
   (printout t "5. " ?m " is a mother." crlf)
   (printout t "6. " ?c " is a son." crlf)
   (printout t "7. " ?f " is a male." crlf)
   (printout t "8. " ?m " is a female." crlf)
   (printout t "9. " ?c " is a male." crlf)
)