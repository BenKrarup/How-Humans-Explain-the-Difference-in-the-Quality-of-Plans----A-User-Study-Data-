(define (domain bridge_delivery)
  (:requirements :typing :durative-actions :fluents) 
  (:types 
    prod driver truck - locatable
    meat cereal - prod
    location
  )
  (:predicates 
    (at ?l1 - locatable ?l2 - location)
    (in ?p - prod ?t - truck)
    (boarded ?d - driver ?t - truck)
    (delivery_location ?p - prod ?l - location)
    (can_traverse ?t - truck ?l1 ?l2 - location)
    (refrigerated ?t - truck)
    (can_deliver ?p - prod)
  )

  (:functions
    (time_to_drive ?loc ?loc1 - location)
  )

  (:durative-action load_truck
    :parameters (?prod - prod ?truck - truck ?loc - location)
    :duration (= ?duration 0.01)
    :condition (and 
                  (over all (at ?truck ?loc)) 
                  (at start (at ?prod ?loc))
                )
    :effect (and 
              (at start (not (at ?prod ?loc))) 
              (at end (in ?prod ?truck))
            )
  )

  (:durative-action board_truck
    :parameters (?d - driver ?t - truck ?l1 - location)
    :duration (= ?duration 0.01)
    :condition (and
                  (over all (at ?t ?l1))
                  (at start (at ?d ?l1))
               )
    :effect (and
              (at start (not (at ?d ?l1)))
              (at end (boarded ?d ?t))
            )
  )

  (:durative-action drive_truck
    :parameters (?d - driver ?t - truck ?l1 ?l2 - location)
    :duration (= ?duration (time_to_drive ?l1 ?l2))
    :condition (and
                  (over all (boarded ?d ?t))
                  (at start (at ?t ?l1))
                  (over all (can_traverse ?t ?l1 ?l2))
               )
    :effect (and
              (at start (not (at ?t ?l1)))
              (at end (at ?t ?l2))
            )
  )

  (:durative-action extend_meat_life
    :parameters (?m - meat ?t - truck)
    :duration (= ?duration 0.01)
    :condition (and
                (over all (in ?m ?t))
                (over all (refrigerated ?t))
              )
    :effect (and
              (at end (can_deliver ?m))
            )
  )

  (:durative-action deliver_produce
    :parameters (?p - prod ?t - truck ?l - location)
    :duration (= ?duration 0.01)
    :condition (and
                  (over all (delivery_location ?p ?l))
                  (over all (at ?t ?l))
                  (at start (in ?p ?t))
                  (over all (can_deliver ?p))
               )
    :effect (and
              (at start (not (in ?p ?t)))
              (at end (at ?p ?l))
            )
  )


)