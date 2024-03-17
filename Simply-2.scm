#lang simply-scheme
(define (vowel? x) (member? x '(a e i o u)))
               


(+ 3 5)
(sqrt 144)
(count 765432)
(/ 1 987654321987654321)

(remainder 12 -5)

(round 17.5)

(butfirst 'a)

(count 765432)

(word 3.14 1592654)

;(+ 6 'seven)

(expt -3 .5)

(expt -3 -3)

;(remainder 5 0) error division with 0 

(butfirst '(yer blues))

;(butlast '()) ;;invalid argument '()

(every first '(the long and winding road))

;(keep vowel? '(constantinople))

;;========================================

;; Exercise 2.1
(word 'now 'here)                   ;; nowhere
(sentence 'now 'here)               ;; '(now here)
(first 'blackbird)                  ;; 'b
(first '(blackbird))                ;; 'blackbird
(+ 3 4)                             ;; 7
(every bf '(thank you girl))        ;; (hank ou irl
(member? 'e 'aardvark)              ;; false
(member? 'the '(the time is yours)) ;; true
(keep vowel? '(i will))             ;; '(i)
(keep vowel? '())                   ;;
;(last '())                         ;; '()
(every last '(honey pie))           ;; '(y e)
(keep vowel? 'taxman)               ;; aa

;; Exercise 2.2
;; What is the domain of the vowel? function?
;; Sentence or word is domain

;; Exercise 2.3

(appearances 'e "hello friend")

;; String String -> Number
;; Counts appearances of first argument in second 1
;; Domain is String (Word and Senteces)
;; Range is Number

;; Exercise 2.4
(item 1 '(hello world))

;; Number String -> String
;; Return indexed word or letter with first argument
;; from second argument
;; Domain is String and Number
;; Range to String

;; Exercise 2.5
(count '(hello world))
(even? 10)
(odd? 11)
(not 3)
(number? 10)

;; Exercise 2.6
(butfirst 'h2)

;; Exercise 2.7
(+ 1 2)
(- 2 2)
(/ 2 5)
(* 6 4)
(expt 2 3)
(and #true #false)
(or  #false #false)
(max 10 12 1231 121)
(quotient 10 3)
(remainder 10 3)
(sentence 'hello 'world)
(word 'a 'c 'e)

;; Exercise 2.8
;; Commutative operators
;; *, +, and, or, max

;; Exercise 2.9
;; Associative operators
;; +, *, expt, and, or, max, remainder, sentence, word

(equal? (+ (+ 1 2) 3)  (+ 1 (+ 2 3)))
(equal? (- (- 1 2) 3)  (- 1 (- 2 3)))
(equal? (/ (/ 1 2) 3)  (/ 1 (/ 2 3)))
(equal? (* (* 1 2) 3)  (* 1 (* 2 3)))
(equal? (expt (expt 1 2) 3)  (expt 1 (expt 2 3)))
(equal? (and (and 1 2) 3)  (and 1 (and 2 3)))
(equal? (or (or 1 2) 3)  (or 1 (or 2 3)))
(equal? (max (max 1 2) 3)  (max 1 (max 2 3)))
;(equal? (quotient (quotient 1 2) 3)  (quotient 1 (quotient 2 3)))
(equal? (remainder (remainder 1 2) 3)  (remainder 1 (remainder 2 3)))
(equal? (sentence (sentence 'talk 'to) 'me) (sentence 'talk (sentence 'to 'me)))
(equal? (word (word 'a 'c) 'e) (word 'a (word 'c 'e)))