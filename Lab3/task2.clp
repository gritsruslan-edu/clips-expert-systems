(deftemplate fire
   (slot material)
   (slot class (default none))
)

(deffacts test-fires
   (fire (material wood))
   (fire (material oil))
   (fire (material electrical-equipment))
   (fire (material magnesium))
   (fire (material plastic))
)

(defrule classify-class-A
   ?f <- (fire (material paper | wood | cloth) (class none))
   =>
   (modify ?f (class A))
)

(defrule classify-class-B
   ?f <- (fire (material oil | gas | grease) (class none))
   =>
   (modify ?f (class B))
)

(defrule classify-class-C
   ?f <- (fire (material electrical-equipment) (class none))
   =>
   (modify ?f (class C))
)

(defrule classify-class-D
   ?f <- (fire (material magnesium | sodium | potassium) (class none))
   =>
   (modify ?f (class D))
)

(defrule classify-unknown
   (declare (salience -10))
   ?f <- (fire (class none))
   =>
   (modify ?f (class unknown))
)

(defrule extinguish-class-A
   (fire (material ?m) (class A))
   =>
   (printout t "Матеріал горіння: " ?m crlf)
   (printout t "Категорія пожежі: Клас A" crlf)
   (printout t "Вогнегасники: вода, рідини на водній основі, сухі хімікати." crlf)
   (printout t "Дії: Використовувати агенти, що поглинають тепло або уповільнюють горіння." crlf)
   (printout t "----------------------------------------------------" crlf)
)

(defrule extinguish-class-B
   (fire (material ?m) (class B))
   =>
   (printout t "Матеріал горіння: " ?m crlf)
   (printout t "Категорія пожежі: Клас B" crlf)
   (printout t "Вогнегасники: сухі хімікати, вуглекислий газ, піна, бромтрифторметан." crlf)
   (printout t "Дії: Обмежити доступ повітря, придушити горючі пари або перервати ланцюгову реакцію." crlf)
   (printout t "----------------------------------------------------" crlf)
)

(defrule extinguish-class-C
   (fire (material ?m) (class C))
   =>
   (printout t "Матеріал горіння: " ?m crlf)
   (printout t "Категорія пожежі: Клас C" crlf)
   (printout t "Вогнегасники: сухі хімікати, вуглекислий газ, бромтрифторметан." crlf)
   (printout t "Дії: ВИМКНУТИ ПОДАЧУ ЕЛЕКТРОЕНЕРГІЇ (якщо можливо). Використовувати непровідні агенти для уникнення короткого замикання." crlf)
   (printout t "----------------------------------------------------" crlf)
)

(defrule extinguish-class-D
   (fire (material ?m) (class D))
   =>
   (printout t "Матеріал горіння: " ?m crlf)
   (printout t "Категорія пожежі: Клас D" crlf)
   (printout t "Вогнегасники: триметоксибороксин та просіяний графітований кокс." crlf)
   (printout t "Дії: Використовувати хімікати, що поглинають тепло та не вступають у реакцію з палаючими металами." crlf)
   (printout t "----------------------------------------------------" crlf)
)

(defrule extinguish-unknown
   (fire (material ?m) (class unknown))
   =>
   (printout t "Матеріал горіння: " ?m crlf)
   (printout t "Категорія пожежі: Невідома" crlf)
   (printout t "Вогнегасники: невідомо." crlf)
   (printout t "Дії: Інструкції для даного матеріалу відсутні в базі знань. Необхідно викликати спеціалістів." crlf)
   (printout t "----------------------------------------------------" crlf)
)