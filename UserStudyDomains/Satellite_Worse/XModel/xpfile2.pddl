(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite - satellite
	instrument1 - instrument
	instrument2 - instrument
	infrared - mode
	visible - mode
	GroundStation1 - direction
	Star1 - direction
	GroundStation2 - direction
	planet1 - direction
	planet2 - direction
	phenomenon1 - direction
	phenomenon2 - direction
	Star2 - direction
)
(:init
	(supports instrument1 infrared)
	(calibration_target instrument1 Star1)
	(supports instrument2 visible)
	(supports instrument2 infrared)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument1 satellite)
	(on_board instrument2 satellite)
	(power_avail satellite)
	(pointing satellite planet2)
	
	(not_same GroundStation1 Star1)
	(not_same GroundStation1 GroundStation2)
	(not_same GroundStation1 planet1)
	(not_same GroundStation1 planet2)
	(not_same GroundStation1 phenomenon1)
	(not_same GroundStation1 phenomenon2)
	(not_same GroundStation1 Star2)

	(not_same Star1 GroundStation1)
	(not_same Star1 GroundStation2)
	(not_same Star1 planet1)
	(not_same Star1 planet2)
	(not_same Star1 phenomenon1)
	(not_same Star1 phenomenon2)
	(not_same Star1 Star2)

	(not_same GroundStation2 GroundStation1)
	(not_same GroundStation2 Star1)
	(not_same GroundStation2 planet1)
	(not_same GroundStation2 planet2)
	(not_same GroundStation2 phenomenon1)
	(not_same GroundStation2 phenomenon2)
	(not_same GroundStation2 Star2)

	(not_same planet1 GroundStation1)
	(not_same planet1 Star1)
	(not_same planet1 GroundStation2)
	(not_same planet1 planet2)
	(not_same planet1 phenomenon1)
	(not_same planet1 phenomenon2)
	(not_same planet1 Star2)

	(not_same planet2 GroundStation1)
	(not_same planet2 Star1)
	(not_same planet2 GroundStation2)
	(not_same planet2 planet1)
	(not_same planet2 phenomenon1)
	(not_same planet2 phenomenon2)
	(not_same planet2 Star2)

	(not_same phenomenon1 GroundStation1)
	(not_same phenomenon1 Star1)
	(not_same phenomenon1 GroundStation2)
	(not_same phenomenon1 planet1)
	(not_same phenomenon1 planet2)
	(not_same phenomenon1 phenomenon2)
	(not_same phenomenon1 Star2)

	(not_same phenomenon2 GroundStation1)
	(not_same phenomenon2 Star1)
	(not_same phenomenon2 GroundStation2)
	(not_same phenomenon2 planet1)
	(not_same phenomenon2 planet2)
	(not_same phenomenon2 phenomenon1)
	(not_same phenomenon2 Star2)

	(not_same Star2 GroundStation1)
	(not_same Star2 Star1)
	(not_same Star2 GroundStation2)
	(not_same Star2 planet1)
	(not_same Star2 planet2)
	(not_same Star2 phenomenon1)
	(not_same Star2 phenomenon2)
)
(:goal (and
	(have_image planet1 infrared)
	(have_image planet2 infrared)
	(have_image phenomenon1 visible)
	(have_image phenomenon2 infrared)
	(have_image Star2 infrared)
	(done-take_image satellite phenomenon2 instrument1 infrared)
))
(:metric minimize (total-time))

)
