(defrule find-specific-person
    (person (name Ivan Petrenko) (age 25))
=>
    (printout t "Знайдено точний збіг: Ivan Petrenko, якому 25 років!" crlf)
)