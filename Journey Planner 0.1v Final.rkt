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
                       

(define button (new button%
[ parent myframe ]
[ label " Find Journey " ]
[ callback (λ (o e)
             (send new-message set-label (slist->string(route (send choice-from get-selection)
                             (send choice-to get-selection) route1)))
             (send new-message show #t) (send new-message1 show #t))]))


(define return-button (new button%
                       [label "Return Journey"]
                       [parent myframe]
                       [ callback (λ (o e) (send new-message set-label (slist->string (reverse(route (send choice-from get-selection)
                             (send choice-to get-selection) route1))))
             (send new-message show #t) (send new-message1 show #t))]))



(define new-message1 (new message%
                         [label "Your Journey :"]
                         [parent myframe] [stretchable-width #t] ))
(define new-message (new message%
                         [label "Your Journey :"]
                         [parent myframe] [stretchable-width #t]))

(send new-message show #f)
(send new-message1 show #f)                   