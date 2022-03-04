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
