#lang racket
;------------------------------------|
;END OF BLOCK - 1 PROJECT            |
;------------------------------------|
;GROUP MEMBERS:                      |
;VIVEK AMIT SHETH [M00827627]        |
;ARRON SURAJ SINGH LOHIA [M00814470] |
;KABITA PURJA [M00664409]            |
;SHREYANSH NAROLA [M00833534]        |
;------------------------------------|

;-----------------------------------------------|
;Here below there is a state table which        |
;contains all the states and events included    |
;in the finite state machine.                   |
;And the state table is made by Shreyansh Narola|
;and KABITA PURJA                               |
;-----------------------------------------------|
(define STATE-TABLE
  '(
    (("NOT ACTIVE" "TOUCH THE SCREEN") "SELECT A NUMBER")                ;Right now, the machine is not active but when the customer toucjhes the screen the machine is actie and the customer can now buy whatever he\she wants.
    
    (("SELECT A NUMBER" 1) "CHIPS - 1")                                  ;If the customer selects number - 1 then the customer will the get the chips - 1
    (("SELECT A NUMBER" 2) "CHIPS - 2")                                  ;If the customer selects number - 2 then the customer will the get the chips - 2
    (("SELECT A NUMBER" 3) "CHIPS - 3")                                  ;If the customer selects number - 3 then the customer will the get the chips - 3
    (("SELECT A NUMBER" 4) "CHIPS - 4")                                  ;If the customer selects number - 4 then the customer will the get the chips - 4
    (("SELECT A NUMBER" 5) "CHIPS - 5")                                  ;If the customer selects number - 5 then the customer will the get the chips - 5
    (("SELECT A NUMBER" 6) "CHIPS - 6")                                  ;If the customer selects number - 6 then the customer will the get the chips - 6
    (("SELECT A NUMBER" 7) "CHIPS - 7")                                  ;If the customer selects number - 7 then the customer will the get the chips - 7
    (("SELECT A NUMBER" 8) "CHIPS - 8")                                  ;If the customer selects number - 8 then the customer will the get the chips - 8
    (("SELECT A NUMBER" 9) "CHIPS - 9")                                  ;If the customer selects number - 9 then the customer will the get the chips - 9
    (("SELECT A NUMBER" 10) "CHIPS - 10")                                ;If the customer selects number - 10 then the customer will the get the chips - 10
    
    
    (("SELECT A NUMBER" 11) "DRINK - 1")                                 ;If the customer selects number - 11 then the customer will the get the drink - 1
    (("SELECT A NUMBER" 12) "DRINK - 2")                                 ;If the customer selects number - 12 then the customer will the get the drink - 2
    (("SELECT A NUMBER" 13) "DRINK - 3")                                 ;If the customer selects number - 13 then the customer will the get the drink - 3
    (("SELECT A NUMBER" 14) "DRINK - 4")                                 ;If the customer selects number - 14 then the customer will the get the drink - 4
    (("SELECT A NUMBER" 15) "DRINK - 5")                                 ;If the customer selects number - 15 then the customer will the get the drink - 5
    (("SELECT A NUMBER" 16) "DRINK - 6")                                 ;If the customer selects number - 16 then the customer will the get the drink - 6
    (("SELECT A NUMBER" 17) "DRINK - 7")                                 ;If the customer selects number - 17 then the customer will the get the drink - 7
    (("SELECT A NUMBER" 18) "DRINK - 8")                                 ;If the customer selects number - 18 then the customer will the get the drink - 8
    (("SELECT A NUMBER" 19) "DRINK - 9")                                 ;If the customer selects number - 19 then the customer will the get the drink - 9
    (("SELECT A NUMBER" 20) "DRINK - 10")                                ;If the customer selects number - 20 then the customer will the get the drink - 10
    
    (("CHIPS" "PROCESS") "CONTINUE SHOPPING")                            ;If the customer selects chips then the machine will process the command and will take the customer to the continue shopping tab\window

    (("DRINKS" "PROCESS") "CONTINUE SHOPPING")                           ;If the customer selects drinks then the machine will process the command and will take the customer to the continue shopping tab\window

    
    (("CONTINUE SHOPPING" "PRESS CHECK OUT") "CHECK-OUT")                ;When the customer is done with the shopping then the customer can press the check-out button to complete the shopping
    (("CONTINUE SHOPPING" "PRESS CS") "SELECT A NUMBER")                 ;when the customer is done with shopping and wants to add a few more item then the customer can press the CS button to go back to shop something else   
    
    (("CHECKOUT" "TAP CARD") "NOT APPROVED")                             ;At the point of check-out, the customer needs to tap their bank card to pay for the items but the transacation is not approved 
    (("CHECKOUT" "TAP CARD") "APPROVED")                                 ;At the point of check-out, the customer needs to tap their bank card to pay for the items but the transacation is approved
    (("CHECKOUT" "PRESS REMOVE") "REMOVING ITEM")                        ;If the customer wants to remove any of the items from the check-out bag then the customer has to press the remove button to remove the items
    (("CHECKOUT" "PRESS BACK") "CONTINUE SHOPPING")                      ;If the customer wants to add any of the items to the check-out bag then the customer has to press the back button to go back to the continue shopping window/tab

    
    (("REMOVING ITEM" "PRESS FINISH REMOVE") "CONTINUE SHOPPING")        ;When the customer is finished removing the items from the check-out bag then the customer has to press the finish remove button to go back to the continue shopping tab/window
    (("REMOVING ITEM" "PRESS THE NUMBER") "SELECT A NUMBER")             ;If the customer wants to remove any item from the check-out bag then the customer has to type the number of the item to remove it
    
    (("NOT APPROVED" "MAX 5 TRIES") "NOT ACTIVE")                        ;If the transaction of the customer is not approved and the customer tries more than 5 times to tap the bank card on the transaction machine then the machine will go to it's not active window
    
    (("APPROVED" "COLLECT THE ITEM") "COLLECTED")                        ;When the transaction of the customer is approved then the machine will show a message to collect the item(s) for 5 sec and after the remainder the machine will go to it's final state where the items are collected
    
    (("COLLECTED" "RESET") "NOT ACTIVE")                                 ;After the item(s) are collected from the machine the machine will take 3 sec to reset itself for the next customer
    
    ))
;-------------------------------------------------------------|
;The function below describes the transition from one state   |
;to the next state.                                           |
;This part of the code is done by Vivek Amit Sheth & Arron    |
;[SOB : 7,8,101,102]                                          |    
;-------------------------------------------------------------|
  
(define further-state (λ (START-STATE EVENT STATE-TABLE)
                     
                        (cond                                                                   ;It is a conditional statement for the code
                          ((empty? STATE-TABLE) "false")                                        ;It checks whether the state-table is empty or not and if it is then it will return "false"
                          ((and                                                                 ;This code just checks whether the inputs-
                            (equal?  START-STATE  (first (first (first STATE-TABLE))))          ;given to the code is write or not which means that -
                            (equal?  EVENT   (first (reverse (first (first STATE-TABLE)))))     ;does it follow the correct state and event or 
                            (first (reverse (first STATE-TABLE)))))                             ;the state and event has the connection in both of them and if they practically and logically correct then it will return the next event
                          (else                                                                 ;If the input is practically/logically incorrect then the code will use recursion whicheither print a correct next state
                            (further-state START-STATE EVENT (rest STATE-TABLE))))))            ;/it will create a loop till the state table is empty and the output is 'False'
                 
;--------------------------------------------------------|
;The function below is the main function of the code\    |
;fsm code                                                |
;This part is done by Vivek Amit Sheth                   |                                      
;--------------------------------------------------------|                                      
                      
(define run-transition (λ (First-state event-seq STATE-TABLE )
                       (cond                                                                    ;It is a conditional statement for the code
                         ((null? event-seq) "false")                                            ;If the event-seq is empty then it will return false
                         (else                                                                 
                          (set! First-state (further-state First-state (first event-seq) STATE-TABLE))
                          (run-transition First-state (rest event-seq) STATE-TABLE )
                          (sleep 0)
                          (println First-state)))))
;-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
;More sobs                                                                                                                                                        |
;10:Contribute individually to the code of an end-of-block project and discuss your contribution, explaining the code in detail and answering questions about it. |
;12:Construct, manipulate and discuss simple graphical representations of deterministic finite state machines.                                                    |
;21:Work effectively as part of a group, demonstrating respect for others and contributing to shared goals.                                                       |
;113:Write simple technical documentation.                                                                                                                        |
;217:Write Racket code to implement a given finite state machine.                                                                                                 |
;-----------------------------------------------------------------------------------------------------------------------------------------------------------------|                                                                            
(run-transition "APPROVED" '("COLLECT THE ITEM" "RESET") STATE-TABLE)                             
                           
                        
                        
                         
                         

                           
                           


                          
                          
                          
                         
                        
                        
                         
                         
                      
                       




                       
                       
                     
                         
                        

