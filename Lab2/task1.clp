(deftemplate person
   (slot name)
   (slot gender)
   (slot role)
)

(deftemplate parent-of
   (slot parent)
   (slot child)
   (slot type (allowed-values father mother))
)

(deftemplate parents-of
   (slot father)
   (slot mother)
   (slot child)
)

(deffacts initial-family-facts
   (person (name Tom) (gender male) (role father))
   (person (name Susan) (gender female) (role mother))
   (person (name John) (gender male) (role son))
   
   (parent-of (parent Tom) (child John) (type father))
   (parent-of (parent Susan) (child John) (type mother))
   (parents-of (father Tom) (mother Susan) (child John))
)