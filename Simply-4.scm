#lang simply-scheme

;; Exercise 4.1
(define (ho-hum x y)
  (+ x (* 2 y)))

(ho-hum 8 12)

(+ 8 (* 2 12))

(+ 8 24)

32

;; Exercise 4.2
(define (yawn x)
  (+ 3 (* x 2)))

(yawn (/ 8 2))
(yawn 4)
(+ 3 (* 4 2))
(+ 3 8)
11

;; Alonzo hires -> Alice for evaluation of / procedure and give it to Alonzo
;; Then Alonzo goes and hires Matt for + operation
;; Then Matt hires Jane for * operation Jane gives calculation back to Matt.
;; Matt calculates + operation gives result to Alonzo.

;; Exercise 4.3

;a
(define (f x y) (- y x))
;; Removes x from y
(f 4 2) ; 2

;b
(define (identity x) x)
;; Identity function
(identity 10) ; 10

;c
(define (three x) 3)
;; Gives 3 independent from argument
(three 10) ; 3

;d
(define (seven) 7)
;; Gives seven no argument
(seven) ; 7

;e
(define (magic n)
  (- (/ (+ (+ (* 3 n)
              13)
           (- n 1))
        4)
     3))

;; Gives given value but does it with a bit magic
(magic 10) ; 10

;; Exercise 4.4
;a
#;
(define (sphere-volume r)
  (* (/ 4 3) 3.141592654)
  (* r r r))

;; Formula for sphere-volume is ((4/3)*pi)*(r^3)
;; body of function missing * operation

(define (sphere-volume r)
  (* (* (/ 4 3) 3.141592654)
     (* r r r)))

;b
#;
(define (next x)
  (x + 1))

;; Wrong usage of + operator
;; (+ x 1) should be the right way

(define (next x)
  (+ x 1))

;c
#;
(define (square) (* x x))

;; Missing the formal parameter x

(define (square x) (* x x))

;d
#;
(define (triangle-area triangle)
  (* 0.5 base height))

;; What is triangle? Is it combination of base and height?
;; What is base? Is it inside of the triangle?
;; What is height? Is it inside of the triangle?
;; base and triangle should be the formal parameter

(define (triangle-area base height)
  (* 0.5 base height))

;e
#;
(define (sum-of-squares (square x) (square y))
  (+ (square x) (square y)))

;; Cannot use (square x) argument
;; square process cannot be formal parameter
(define (sum-of-squares x y)
  (+ (square x) (square y)))

;; Exercise 4.5

;; Convert Celcius to Fahrenheit
(define (CtoF x)
  (+ (* (/ 9 5) x 1.0) 32))

;; Convert Fahrenheit to Celcius
(define (FtoC x)
  (* (/ 5 9) 1.0 (- x 32)))

;; Execise 4.6
; With * operator
(define (fourth1 x)
  (* x x x x))

; With square procedure
(define (fourth2 x)
  (square (square x)))

;; Exercise 4.7
(define (absolute x)
  (sqrt (square x)))

;; Exercise 4.8
(define (scientific num pw)
  (* 1.0 num (expt 10 pw)))

;; Exercise 4.9
(define (discount price percent)
  (- price (* price (/ percent 100.0))))


;; Exercise 4.10
(define (tip bill)
  (ceiling (* bill (/ 15.0 100.0))))