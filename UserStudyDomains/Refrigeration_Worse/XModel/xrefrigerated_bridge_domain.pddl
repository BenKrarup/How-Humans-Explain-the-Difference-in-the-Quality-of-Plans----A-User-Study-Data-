(define (domain bridge_delivery)

(:requirements :typing :numeric-fluents :object-fluents :durative-actions )

(:types location prod driver truck  - locatable
 meat cereal  - prod
)

(:predicates
      (at ?l1 - locatable ?l2 - location)
      (in ?p - prod ?t - truck)
      (boarded ?d - driver ?t - truck)
      (delivery_location ?p - prod ?l - location)
      (can_traverse ?t - truck ?l1 - location ?l2 - location)
      (refrigerated ?t - truck)
      (can_deliver ?p - prod)
      (done-deliver_produce ?p - prod ?t - truck ?l - location)
      (done-deliver_produce ?p - prod ?t - truck ?l - location)
)

(:functions
      (time_to_drive ?loc - location ?loc1 - location)
)

(:durative-action  load_truck
     :parameters (?prod - prod ?truck - truck ?loc - location)
     :duration (= ?duration 0.01)
     :condition (and
             (at start (at ?prod ?loc))
           (over all (at ?truck ?loc)))
     :effect (and
             (at end (in ?prod ?truck))
             (at start (not (at ?prod ?loc))))
)

(:durative-action  board_truck
     :parameters (?d - driver ?t - truck ?l1 - location)
     :duration (= ?duration 0.01)
     :condition (and
             (at start (at ?d ?l1))
           (over all (at ?t ?l1)))
     :effect (and
             (at end (boarded ?d ?t))
             (at start (not (at ?d ?l1))))
)

(:durative-action  drive_truck
     :parameters (?d - driver ?t - truck ?l1 - location ?l2 - location)
     :duration (= ?duration (time_to_drive ?l1 ?l2))
     :condition (and
             (at start (at ?t ?l1))
           (over all (boarded ?d ?t))
           (over all (can_traverse ?t ?l1 ?l2)))
     :effect (and
             (at end (at ?t ?l2))
             (at start (not (at ?t ?l1))))
)

(:durative-action  extend_meat_life
     :parameters (?m - meat ?t - truck)
     :duration (= ?duration 0.01)
     :condition (and
           (over all (in ?m ?t))
           (over all (refrigerated ?t)))
     :effect (and
             (at end (can_deliver ?m)))
)

(:durative-action  deliver_produce
     :parameters (?p - prod ?t - truck ?l - location)
     :duration (= ?duration 0.01)
     :condition (and
             (at start (in ?p ?t))
           (over all (delivery_location ?p ?l))
           (over all (at ?t ?l))
           (over all (can_deliver ?p)))
     :effect (and
             (at start (done-deliver_produce ?p ?t ?l))
             (at end (at ?p ?l))
             (at start (not (in ?p ?t)))
             (at start (not (done-deliver_produce ?p ?t ?l))))
)

)
