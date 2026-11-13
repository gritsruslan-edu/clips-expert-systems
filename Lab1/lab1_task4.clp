(deftemplate person
    (slot name)
    (slot age)
    (slot gender)
)

(deffacts people
    (person (name Ivan) (age 25) (gender male))
    (person (name Maria) (age 22) (gender female))
    (person (name Petro) (age 30) (gender male))
)