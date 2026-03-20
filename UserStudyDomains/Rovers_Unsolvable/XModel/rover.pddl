(define (domain Rover)
(:requirements :typing :durative-actions :fluents :duration-inequalities)
(:types rover waypoint store lander launcher)

(:predicates            
             (at ?x - rover ?y - waypoint) 
             (at_lander ?x - lander ?y - waypoint)
             (can_traverse ?r - rover ?x - waypoint ?y - waypoint)
	     (equipped_for_soil_analysis ?r - rover)
             (equipped_for_rock_analysis ?r - rover)
             
             (have_rock_analysis ?r - rover ?w - waypoint)
             (have_soil_analysis ?r - rover ?w - waypoint)

             (available ?r - rover)
             (visible ?w - waypoint ?p - waypoint)

             (communicated_soil_data ?w - waypoint)
             (communicated_rock_data ?w - waypoint)

	     (at_soil_sample ?w - waypoint)
	     (at_rock_sample ?w - waypoint)


	     (channel_free ?l - lander)
	      (in_sun ?w - waypoint)
	      
	      (using ?r - rover)
	      (not-in-use ?la - launcher)
	      
	      ;;(done_communicated_soil_data ?r - rover ?w - waypoint)
              ;;(done_communicated_rock_data ?r - rover ?w - waypoint)
              
              (notcharging ?r - rover)

)
(:functions (energy ?r - rover) (recharge-rate ?x - rover))

;; using rover ?r
(:durative-action use
:parameters (?la - launcher ?r - rover) 
:duration (= ?duration 0.001)
:condition (and 
                (at start (not-in-use ?la))
	    )
:effect (and 
                (at end (using ?r))
                (at end (not (not-in-use ?la)))
         )
)


;; ?x navigates from ?y to ?z	
(:durative-action navigate
:parameters (?x - rover ?y - waypoint ?z - waypoint) 
:duration (= ?duration 5)
:condition (and 
                (over all (using ?x))
                (over all (can_traverse ?x ?y ?z)) (at start (available ?x)) (at start (at ?x ?y))  (at start (>= (energy ?x) 5))
                ;;(over all (visible ?y ?z))
	    )
:effect (and (at start (decrease (energy ?x) 5)) (at start (not (at ?x ?y))) (at end (at ?x ?z))))


;; recharge ?x at ?w
(:durative-action recharge
:parameters (?x - rover ?w - waypoint)
:duration (= ?duration 1)
:condition (and 
                (over all (using ?x))
                (at start (at ?x ?w)) (over all (at ?x ?w)) 
		(at start (in_sun ?w)) (at start (<= (energy ?x) 20))
		(at start (notcharging ?x))
		)
:effect (and 
             (at start (not (notcharging ?x)))
             (at end (increase (energy ?x) (recharge-rate ?x)))
             (at end (notcharging ?x))
             )
)


;; Collect soil data at ?p using ?x
(:durative-action sample_soil
:parameters (?x - rover ?p - waypoint)
:duration (= ?duration 10)
:condition (and 
      (over all (using ?x))
      (over all (at ?x ?p)) (at start (at ?x ?p)) 
      (at start (at_soil_sample ?p)) 
      (at start (equipped_for_soil_analysis ?x)) 
      (at start (>= (energy ?x) 3)) 
		)
:effect (and 
        (at start (decrease (energy ?x) 3)) (at end (have_soil_analysis ?x ?p)) 
        ;;(at end (not (at_soil_sample ?p)))
		)
)


;; Collect rock data at ?p using ?x
(:durative-action sample_rock
:parameters (?x - rover ?p - waypoint)
:duration (= ?duration 8)
:condition (and 
        (over all (using ?x))
        (over all (at ?x ?p)) (at start (at ?x ?p)) (at start (>= (energy ?x) 5)) (at start (at_rock_sample ?p)) (at start (equipped_for_rock_analysis ?x)) 
		)
:effect (and  
           (at end (have_rock_analysis ?x ?p)) (at start (decrease (energy ?x) 5)) 
           ;;(at end (not (at_rock_sample ?p)))
		)
)



;; communicate the soil data of ?p with ?l visible from ?x using ?r that is at ?x
(:durative-action communicate_soil_data
 :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
 :duration (= ?duration 10)
 :condition (and 
                   (over all (using ?r))
                   (over all (at ?r ?x)) (over all (at_lander ?l ?y)) (at start (have_soil_analysis ?r ?p)) (at start (>= (energy ?r) 4))
                   ;;(at start (visible ?x ?y)) 
                   (at start (available ?r))(at start (channel_free ?l))
            )
 :effect (and (at start (not (available ?r))) (at start (not (channel_free ?l))) (at end (channel_free ?l))
		(at end (communicated_soil_data ?p))(at end (available ?r))(at start (decrease (energy ?r) 4))
		;;(at end (done_communicated_soil_data ?r ?p))
	)
)

;; communicate the rock data of ?p with ?l visible from ?x using ?r that is at ?x
(:durative-action communicate_rock_data
 :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
 :duration (= ?duration 10)
 :condition (and 
                   (over all (using ?r))
                   (over all (at ?r ?x)) 
                   (over all (at_lander ?l ?y)) 
                   ;;(over all (visible_lander ?l ?x))
                   (at start (have_rock_analysis ?r ?p)) 
                   ;;(at start (visible ?x ?y)) 
                   (at start (available ?r))(at start (channel_free ?l)) (at start (>= (energy ?r) 4))
            )
 :effect (and (at start (not (available ?r))) (at start (not (channel_free ?l))) (at end (channel_free ?l))(at end (communicated_rock_data ?p))(at end (available ?r)) (at start (decrease (energy ?r) 4))
 ;;(at end (done_communicated_rock_data ?r ?p))
          )
)




)
