(deftemplate sparse-array-element
   (slot index (type INTEGER))
   (slot value)
)

(deffacts array-data
   (sparse-array-element (index 2) (value 42))
   (sparse-array-element (index 15) (value 15))
   (sparse-array-element (index 104) (value 99))
)