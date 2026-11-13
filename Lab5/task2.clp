(deftemplate sensor
   (slot id (type INTEGER))
   (slot status (allowed-values ok faulty))
)


(defrule critical-warning
   
   (sensor (id ?id1) (status faulty))
   (sensor (id ?id2&:(> ?id2 ?id1)) (status faulty))
   (sensor (id ?id3&:(> ?id3 ?id2)) (status faulty))
   (not (warning-issued))

   =>
   (printout t "!!! ПОПЕРЕДЖЕННЯ: Три або більше датчиків несправні !!!" crlf)
   (printout t "Виявлено збій мінімум на датчиках: " ?id1 ", " ?id2 " та " ?id3 crlf)
   (assert (warning-issued))
)