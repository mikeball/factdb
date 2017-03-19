(ns usage)





; the order is placed by a sprint sales rep on the shop
(defn place-order []

    )

; the order is corrected by manalang
(defn correct-order [db order approver]

)


; the order is approved by manalang
(defn approve-order [db order approver]
   (facts/assert
        db ; the factdb database
        (:id order) ; which entity are we asserting on

        ; the facts that we want to assert
        [:order-review/approved true]
        [:approver (:id approver)]  ))



; the order is then shipped
(defn mark-order-shipped [db order]
    (facts/assert
        db ; the factdb database
        (:id order) ; which entity are we asserting on

        ; the facts that we want to assert
        [:order/status    :shipped]
        [:shipping/method "fedex"]
        [:shipping/number "ABC123"] ))


; one thing that would be very valuable would be the ability to specify
; rules about certain states... For instance when an order status is set to 
; shipped, then you must also assert the shipping method and number.



; perhaps a way to model in traditional tables?

; in sql server
; orders - status, rep, total
; orders_approved - fk, approver, when
; orders_shipped - fk, method, number

orders
orders$approved
orders$shipped

orders
Orders#Approvals
order#shipments

orders
order@approvals
order@shipments




