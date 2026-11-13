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

(deffunction determine-class (?material)
   (if (or (eq ?material paper) (eq ?material wood) (eq ?material cloth)) then
      (return A))
   (if (or (eq ?material oil) (eq ?material gas) (eq ?material grease)) then
      (return B))
   (if (eq ?material electrical-equipment) then
      (return C))
   (if (or (eq ?material magnesium) (eq ?material sodium) (eq ?material potassium)) then
      (return D))
   (return unknown)
)

(deffunction print-instructions (?class)
   (if (eq ?class A) then
      (printout t "Вогнегасники: вода, рідини на водній основі, сухі хімікати." crlf)
      (printout t "Дії: Використовувати агенти, що поглинають тепло або уповільнюють горіння." crlf)
   )
   (if (eq ?class B) then
      (printout t "Вогнегасники: сухі хімікати, вуглекислий газ, піна, бромтрифторметан." crlf)
      (printout t "Дії: Обмежити доступ повітря, придушити горючі пари або перервати ланцюгову реакцію." crlf)
   )
   (if (eq ?class C) then
      (printout t "Вогнегасники: сухі хімікати, вуглекислий газ, бромтрифторметан." crlf)
      (printout t "Дії: ВИМКНУТИ ПОДАЧУ ЕЛЕКТРОЕНЕРГІЇ (якщо можливо). Використовувати непровідні агенти." crlf)
   )
   (if (eq ?class D) then
      (printout t "Вогнегасники: триметоксибороксин та просіяний графітований кокс." crlf)
      (printout t "Дії: Використовувати хімікати, що поглинають тепло та не вступають у реакцію з палаючими металами." crlf)
   )
   (if (eq ?class unknown) then
      (printout t "Вогнегасники: невідомо." crlf)
      (printout t "Дії: Інструкції для даного матеріалу відсутні в базі знань. Необхідно викликати спеціалістів." crlf)
   )
)

(defrule classify-fire
   ?f <- (fire (material ?m) (class none))
   =>
   (modify ?f (class (determine-class ?m)))
)

(defrule extinguish-fire
   (fire (material ?m) (class ?c&~none))
   =>
   (printout t "Матеріал горіння: " ?m crlf)
   
   (if (eq ?c unknown) then
      (printout t "Категорія пожежі: Невідома" crlf)
   else
      (printout t "Категорія пожежі: Клас " ?c crlf)
   )
   
   (print-instructions ?c)
   (printout t "----------------------------------------------------" crlf)
)