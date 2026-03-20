Warnings encountered when parsing Domain/Problem File

Errors: 0, warnings: 1
/home/ben/Documents/AIPCausalParser/common/ForUserStudy/Refrigeration_Worse/Original/refrigerated_bridge_problem.pddl: line: 54: Warning: Undeclared requirement :timed-initial-literals 
Parsing and Instantiating...
Done
One way facts...
Mutex groups...
Mutex group t1 = { (at t1 depot) (at t1 butcher) (at t1 grocer)} seems safe for t1
Mutex group t2 = { (at t2 depot) (at t2 butcher) (at t2 grocer)} seems safe for t2
Mutex group t3 = { (at t3 depot) (at t3 butcher) (at t3 grocer)} seems safe for t3
Mutex group meat = { (at meat depot) (in meat t1) (in meat t2) (in meat t3) (at meat butcher)} seems safe for meat
Mutex group cereal = { (at cereal depot) (in cereal t1) (in cereal t2) (in cereal t3) (at cereal grocer)} seems safe for cereal
Mutex group driver = { (at driver depot) (boarded driver t1)} seems safe for driver
Mutex group driver = { (at driver depot) (boarded driver t2)} seems safe for driver
Mutex group driver = { (at driver depot) (boarded driver t3)} seems safe for driver

---------------------------------------------------------------
Final mutex groups:

Mutex group t1 = { (at t1 depot) (at t1 butcher) (at t1 grocer)}
Mutex group t2 = { (at t2 depot) (at t2 butcher) (at t2 grocer)}
Mutex group t3 = { (at t3 depot) (at t3 butcher) (at t3 grocer)}
Mutex group meat = { (at meat depot) (in meat t1) (in meat t2) (in meat t3) (at meat butcher)}
Mutex group cereal = { (at cereal depot) (in cereal t1) (in cereal t2) (in cereal t3) (at cereal grocer)}
Mutex group driver = { (at driver depot) (boarded driver t1)}
Mutex group driver = { (at driver depot) (boarded driver t2)}
Mutex group driver = { (at driver depot) (boarded driver t3)}

Found a mutex group with no dependents: {(at cereal depot), (in cereal t1), (in cereal t2), (in cereal t3), (at cereal grocer), <none-of-those>}
Semaphore Facts...
Envelope Facts...
One-shot actions...
(board_truck driver t1 depot) is 1 shot
(board_truck driver t2 depot) is 1 shot
(board_truck driver t3 depot) is 1 shot
(load_truck meat t1 depot) is 1 shot
(load_truck meat t2 depot) is 1 shot
(load_truck meat t3 depot) is 1 shot
(load_truck cereal t1 depot) is 1 shot
(load_truck cereal t2 depot) is 1 shot
(load_truck cereal t3 depot) is 1 shot
Integral variables...
Variable bounds...
Static numeric conditions...
Duration bounds...
TIL time window analysis...
Bounding action timestamps due to time windows...
Dominance constraints (excluding processes and events)...
Damaging events...
Dominance constraints (including processes and events)...
Variable monotonicity...
Max/min needed values for any single precondition...
Irrelevant action pruning by backward reachability from goal...
Uninterestingness criteria...
Compression-safe actions...
Compression-safe invariants...
100% of durative actions in this problem are compression safe
Goal Goal [3]
    (-(total-time) >= -inf)
    (at cereal grocer)
    (at meat butcher)

Finishing preprocessing.  Making a TRPG heuristic...
Making an open list...
Using POPFMemoisedStates<NonTemporalNumericMemoisedStates,PathPrunedTemporalMemoisedStates<NonTemporalNumericMemoisedStates>>
Running WA* search (g weight = 1, h weight = 5)
{(at t1 depot),(at t2 depot),(at t3 depot),(at driver depot),(at meat depot),(at cereal depot),(can_deliver meat),(can_deliver cereal)}
[]
No automata in the stateInitial heuristic = 7
Initial admissible heuristic = 20.021
Initial inadmissible heuristic = 20.021
Initial stats: t=0s, 6280kb
b (6 @ n=2, t=0s, 6280kb)b (5 @ n=12, t=0s, 6280kb)b (4 @ n=19, t=0s, 6412kb)b (3 @ n=23, t=0s, 6412kb)b (2 @ n=28, t=0s, 6412kb)b (1 @ n=32, t=0s, 6412kb)
;;;; Solution Found
; Time 0.00
; Peak memory 6412kb
; Nodes Generated: 36
; Nodes Expanded:  7
; Nodes Evaluated: 35
; Nodes Tunneled:  0
; Nodes memoised with open actions: 0
; Nodes memoised without open actions: 36
; Nodes pruned by memoisation: 0
; Metric value 35.031
0.001: (load_truck cereal t1 depot) [0.010] ; (3)
0.001: (load_truck meat t1 depot) [0.010] ; (4)
0.001: (board_truck driver t1 depot) [0.010] ; (12)
0.011: (drive_truck driver t1 depot butcher) [20.000] ; (15)
20.011: (deliver_produce meat t1 butcher) [0.010] ; (32)
20.021: (drive_truck driver t1 butcher grocer) [15.000] ; (25)
35.021: (deliver_produce cereal t1 grocer) [0.010] ; (35)
pppdd.
;;;; Solution Found
; Time 0.00
; Peak memory 7184kb
; Nodes Generated: 323
; Nodes Expanded:  71
; Nodes Evaluated: 256
; Nodes Tunneled:  0
; Nodes memoised with open actions: 0
; Nodes memoised without open actions: 323
; Nodes pruned by memoisation: 0
; Metric value 25.031
0.001: (board_truck driver t2 depot) [0.010] ; (13)
0.001: (load_truck cereal t2 depot) [0.010] ; (5)
0.001: (load_truck meat t2 depot) [0.010] ; (6)
0.011: (drive_truck driver t2 depot grocer) [10.000] ; (29)
10.011: (deliver_produce cereal t2 grocer) [0.010] ; (36)
10.021: (drive_truck driver t2 grocer butcher) [15.000] ; (18)
20.991: (extend_meat_life meat t2) [0.010] ; (31)
25.021: (deliver_produce meat t2 butcher) [0.010] ; (33)
d.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.dddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.dd
.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd
ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.dddd.dd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.ddd.dd.ddd.ddd.ddd.ddd.
