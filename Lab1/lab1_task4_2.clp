(deftemplate person
    (multislot name)
    (slot age (type INTEGER))
    (slot gender (allowed-values male female))
)

(deffacts people
    (person (name Ivan Petrenko) (age 25) (gender male))
    (person (name Maria Koval) (age 22) (gender female))
    (person (name Petro) (age 30) (gender male))
)