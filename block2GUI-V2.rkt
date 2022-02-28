#lang racket
(require racket/gui/base)

(define route1 '(1 2 3 4 5 6))
(define route (λ (from to list)
                (println from)
                (drop (take list (+ 1 to )) from)))


( define myframe ( new frame%
[ label " My  Window " ]
[ width 400] [ height 300]))
( send myframe show  #t )

( define choice-from ( new choice%
[ label " From : " ] [ parent myframe ]
[ choices ( list "1"
"2" "3" "4" "5" "6" )]))

( define choice-to ( new choice%
[ label " Destination : " ] [ parent myframe ]
[ choices ( list " 1 "
"2" "3" "4" "5" "6" )]))

(define button (new button%
[ parent myframe ]
[ label " Submit " ]
[ callback (λ (o e) (println (route (send choice-from get-selection) (send choice-to get-selection) route1)))]))