;Header and description

(define (domain Actividad3)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle

    vehiculo localizacion paciente - object
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
; estos átomos se van a usar tanto en las acciones como en el estado final e inicial

    (ubi_amb ?amb - vehiculo ?l - localizacion)
    ; un átomo que me está especificando que tengo un objeto con dos parámetros, el primero de tipo vehículo y el segundo de tipo localización
    (enlace ?l1 - localizacion ?l2 - localizacion)
    ; átomo que simboliza el enlace entre dos ciudades
    (paciente_en_amb ?pac - paciente ?amb - vehiculo)
    (ubi_pac ?pac -paciente ?l - localizacion)

)




;(:functions ;todo: define numeric functions here
; crear una variable estado mediante funciones

;)

;define actions here
(:action Conducir
    :parameters (?amb - vehiculo ?localOrigen - localizacion ?localDestino - localizacion)
    ; el nombre que le ponga a los parámetros sí es importante -> lo seguiré usando 
    :precondition (and 
        (ubi_amb ?amb ?localOrigen)
        (enlace ?localOrigen ?localDestino)
    )
    :effect (and 
        (ubi_amb ?amb ?localDestino)
        ; importante aclarar que el coche no podrá seguir en la ciudad origen
        (not (ubi_amb ?amb ?localOrigen))
    )
)

(:action Subir_pac
    :parameters (?amb - vehiculo ?pac - paciente ?localPaciente - localizacion)
    :precondition (and 
        (ubi_amb ?amb ?localPaciente)
        (ubi_pac ?pac ?localPaciente)
        (not (paciente_en_amb ?pac ?amb))
    )
    :effect (and 
        (paciente_en_amb ?pac ?amb)
        (not (ubi_pac ?pac ?localPaciente))    
    )
)

(:action Bajar_pac
    :parameters (?amb - vehiculo ?pac - paciente  ?localOrigen - localizacion)
    :precondition (and 
        (ubi_amb ?amb ?localOrigen)
        (paciente_en_amb ?pac ?amb)  
    )
    :effect (and 
        (not (paciente_en_amb ?pac ?amb))
        (ubi_pac ?pac ?localOrigen)
        
    )
)



)