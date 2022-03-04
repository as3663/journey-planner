#lang racket/gui

(define route1 '("Hendon Central"
"Brent Cross" "Golders Green" "Chalk Farm" "Camden Town" "Waterloo"))
(define route (λ (from to list)
                
                (drop (take list (+ 1 to )) from)
                (drop (take list (+ 1 to )) from)))

(define slist->string (λ(l)
                        (cond ((empty? l) "")
                              ((empty? (rest l))  (first l))
                              (else (string-append  (first l)
                                                    "-->"
                                                    (slist->string (rest l)))))))



( define myframe ( new frame%
[ label " My  Window " ]
[ width 550] [ height 300]))
( send myframe show  #t )

( define choice-from ( new choice%
[ label "Start From   : " ] [ parent myframe ]
[ choices route1 ]))

( define choice-to ( new choice%
[ label " Destination : " ] [ parent myframe ]
[ choices route1]))