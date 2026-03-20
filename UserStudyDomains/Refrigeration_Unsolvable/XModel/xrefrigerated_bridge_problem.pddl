(define (problem task)
(:domain bridge_delivery)
(:objects
        depot butcher grocer - location
        driver - driver
    t1 t2 t3 - truck
    meat - meat
    cereal - cereal
)
(:init
    (at t1 depot)
    (at t2 depot)
    (at t3 depot)
    (at driver depot)
    (at meat depot)
    (at cereal depot)
    (refrigerated t2)
    (delivery_location meat butcher)
    (delivery_location cereal grocer)
    (can_traverse t1 depot butcher)
    (can_traverse t1 butcher depot)
    (can_traverse t1 depot grocer)
    (can_traverse t1 grocer depot)
    (can_traverse t1 butcher grocer)
    (can_traverse t1 grocer butcher)
    (can_traverse t2 depot butcher)
    (can_traverse t2 butcher depot)
    (can_traverse t2 depot grocer)
    (can_traverse t2 grocer depot)
    (can_traverse t2 butcher grocer)
    (can_traverse t2 grocer butcher)
    (can_traverse t3 depot grocer)
    (can_traverse t3 grocer depot)
    (can_traverse t3 butcher grocer)
    (can_traverse t3 grocer butcher)
    (can_deliver meat)
    (can_deliver cereal)
    (done-deliver_produce meat t1 butcher)
    (done-deliver_produce meat t2 butcher)

    (at 21 (not (can_deliver meat)))

    (= (time_to_drive depot butcher) 20)
    (= (time_to_drive butcher depot) 20)
    (= (time_to_drive butcher grocer) 15)
    (= (time_to_drive grocer butcher) 15)
    (= (time_to_drive depot grocer) 10)
    (= (time_to_drive grocer depot) 10)

)
(:goal (and
    (at meat butcher)
    (at cereal grocer)
    (done-deliver_produce meat t1 butcher)
    (done-deliver_produce meat t2 butcher)
    (done-deliver_produce meat t3 butcher)
))
)
