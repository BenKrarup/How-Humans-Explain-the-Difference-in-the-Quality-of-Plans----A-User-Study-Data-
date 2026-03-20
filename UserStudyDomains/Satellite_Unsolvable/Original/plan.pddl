Number of literals: 29
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No analytic limits found, not considering limit effects of goal-only operators
All the ground actions in this problem are compression-safe
Initial heuristic = 12.000
b (11.000 | 2.000)b (10.000 | 10.001)b (9.000 | 10.002)b (8.000 | 17.002)b (7.000 | 22.002)b (6.000 | 29.002)b (5.000 | 34.002)b (4.000 | 41.002)b (3.000 | 46.002)b (2.000 | 53.002)b (1.000 | 58.002)
; Plan found with metric 65.002
; States evaluated so far: 33
; Time 0.01
0.000: (switch_on instrument2 satellite)  [2.000]
0.000: (turn_to satellite groundstation2 planet2)  [5.000]
5.001: (calibrate satellite instrument2 groundstation2)  [5.000]
5.002: (turn_to satellite phenomenon1 groundstation2)  [5.000]
10.002: (take_image satellite phenomenon1 instrument2 visible)  [7.000]
17.002: (turn_to satellite phenomenon2 phenomenon1)  [5.000]
22.002: (take_image satellite phenomenon2 instrument2 infrared)  [7.000]
29.002: (turn_to satellite planet1 phenomenon2)  [5.000]
34.002: (take_image satellite planet1 instrument2 infrared)  [7.000]
41.002: (turn_to satellite planet2 planet1)  [5.000]
46.002: (take_image satellite planet2 instrument2 infrared)  [7.000]
53.002: (turn_to satellite star2 planet2)  [5.000]
58.002: (take_image satellite star2 instrument2 infrared)  [7.000]

 * All goal deadlines now no later than 65.002

Resorting to best-first search
b (11.000 | 2.000)b (10.000 | 10.001)b (9.000 | 10.002)b (8.000 | 17.002)b (7.000 | 22.002)b (6.000 | 29.002)b (5.000 | 34.002)b (4.000 | 41.002)b (3.000 | 46.002)b (2.000 | 53.002)b (1.000 | 58.002)
