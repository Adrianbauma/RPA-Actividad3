(define (problem problema_2) (:domain Actividad3)
(:objects ; son todos los que intervienen en el problema (ciudades, vehiculos, etc)
    ambulancia - vehiculo
    l1_hospital - localizacion
    l2 l4 l3 l5 l6 - localizacion
    pac1 pac2 - paciente
)

(:init
    ;todo: put the initial state's facts and numeric values here
    ; es colocar los prediados pero instanciados
    (ubi_amb ambulancia l1_hospital)
    (enlace l1_hospital l2)
    (enlace l2 l1_hospital)
    (enlace l2 l4)
    (enlace l4 l2)
    (enlace l4 l3)
    (enlace l3 l4)
    (enlace l4 l5)
    (enlace l5 l4)
    (enlace l6 l5)
    (enlace l5 l6)
    (ubi_pac pac1 l6)
    (ubi_pac pac2 l3)
    
)

(:goal (and
    ;todo: put the goal condition here
    (ubi_amb ambulancia l1_hospital)
    (ubi_pac pac1 l1_hospital)
    (ubi_pac pac2 l1_hospital)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
; lo que dice es si queremos que nuestro panificador debe maximizar o minimizar algun elemento (ej. gasolina)
)