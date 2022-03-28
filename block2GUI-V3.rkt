#lang racket
(require racket/gui/base)
;We are defining the routes and are displaying the routes that are available with our GUI unit.

(define route1 '("Hendon Central"
"Brent Cross" "Golders Green" "Chalk Farm" "Camden Town" "Waterloo"))
(define route (λ (from to list)
                (println from)
                ;A loop that goes through every single item in the list, in-order for it go to the next one it uses the "+1" command. 
                (drop (take list (+ 1 to )) from)
                (drop (take list (+ 1 to )) from)))


;This creates a new window for our GUI unit, from there we have set the width and height to make it a small window.. Furthermore we have added in a define statement for the options
; that are given to us when the GUI pops up.. "Start From"  "Destination" etc.
( define myframe ( new frame%
[ label " PAAJ Route Planner " ];Label of our GUI
[ width 400] [ height 300]));Width and Height of window.
( send myframe show  #t );Displaying our frame. 

;This part of the code defines the "Start From" line on the GUI but it presents our choice of stations. The user is given a drop down menu to select from.
( define choice-from ( new choice%
[ label "Start From   : " ] [ parent myframe ] ;The myframe is the parent of this choice, the myframe then connects to whole code together to link them to the main window frame. 
[ choices ( list "Hendon Central" ;Choices we have from stations.
"Brent Cross" "Golders Green" "Chalk Farm" "Camden Town" "Waterloo" )])) ;6 Stations.

;
( define choice-to ( new choice%
[ label " Destination : " ] [ parent myframe ];Label of the "Destination" and linking the code to be made into 1.
[ choices ( list "Hendon Central" ;Choices of stations we are given as part of our arrival port.
"Brent Cross" "Golders Green" "Chalk Farm" "Camden Town" "Waterloo" )]))
                       

(define button (new button%
[ parent myframe ]
[ label " Find journey " ];Find journey label
[ callback (λ (o e);This button when pressed gives us the destination route from the start point and to the destination, it will provide us with all our stops and where we are going in the output window
             (println (route (send choice-from get-selection)
                             (send choice-to get-selection) route1))
             (send new-message show #t))]))


(define return-button (new button%
                       [label "Return Journey"];Label return 
                       [parent myframe]
                       [ callback (λ (o e) (println (reverse (route (send choice-from get-selection) (send choice-to get-selection) route1))))]));following line of code dicates how the user can
;return back to their point of origin when they started out the journey. 



(define new-message (new message%
                         [label "Your Journey :"];This message will be displayed when the journey is defined and is outputted by the program showing the user their route via the GUI
                         [parent myframe]))

(send new-message show #f);We have placed the #f in-order for the program not to show us anything until the show your journey command has been activated.                    