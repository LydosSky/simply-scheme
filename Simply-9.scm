#lang simply-scheme

;; Exercise 9.1
(lambda (x) (+ (* x 3) 4))       ; <procedure>

((lambda (x) (+ (* x 3) 4)) 10)  ; 34

(every (lambda (wd) (word (last wd) (bl wd)))  ;(yan etim ta lal)
       '(any time at all))

#;
((lambda (x) (+ x 3)) 10 15)     ; error

;; Exercise 9.2
(define (second stuff)
  (first (bf stuff)))

((lambda (stuff) (first (bf stuff))) 'hello)

(define (make-adder num)
  (lambda (x) (+ num x)))

(((lambda (num) (lambda (x) (+ num x))) 3) 4)

;; Exercise 9.3
(define (let-it-be sent)
  (accumulate (lambda (x y) y) sent))

; returns last word of the sentence

;; Exercise 9.4
(define (who sent)
  (define (describe person)
    (se person sent))
  (every describe '(pete roger john keith)))

;; Exercise 9.5
(define (prepend-every lett sent)
  (every (lambda (wd) (word lett wd)) sent)) 

;; Exercise 9.6
(define (sentence-version fn)
  (lambda (sent) (every fn sent)))

((sentence-version first) '(Good Morning Sunshine))
((sentence-version (lambda (x) (* x x))) '(21 9 1994))

;; Exercise 9.7
(define (letterwords lett sent)
  (keep (lambda (wd) (member? lett wd)) sent))

(letterwords 'o '(got to get you into my life))

;; Exercise 9.8
(define (hang-letter letter guesses)
  (if (member? letter guesses)
      letter
      '_))

(define (hang sent guesses)
  (every (lambda (x) (hang-letter x guesses)) sent))

;; Exercise 9.9
(define (common-words sent1 sent2)
  (keep (lambda (wd) (member? wd sent2)) sent1))

;; Exercise 9.10
(define (appearances letter sent)
  (count (keep (lambda (wd) (member? letter wd)) sent)))

;; Exercise 9.11

(define (unabbrev sent1 sent2)
  (every
   (lambda (wd) (if (number? wd) (item wd sent2) wd)) sent1))

;; Exercise 9.12
(define (first-last sent)
  (keep (lambda (wd) (equal? (first wd) (last wd))) sent))

;(first-last '(california ohio nebraska alabama alaska massachusetts))

;; Exercise 9.13
(define (compose fn1 fn2)
  (lambda (x) (fn1 (fn2 x))))

(define seconds (compose first bf))

;; Exercise 9.14
(define (substitute wd1 wd2 sent)
  (every (lambda (wd) (if (equal? wd wd2) wd1 wd)) sent))

;; Exercise 9.15
(define (type-check fn pred)
  (lambda (x) (if (pred x) (fn x) #f)))

(define safe-sqrt (type-check sqrt number?))

;; Exercise 9.16
(define (aplize fn)
  (lambda (x) (if (or (number? x) (word? x)) (fn x) (every fn x))))

(define apl-sqrt (aplize sqrt))

;; Exercise 9.17
(define (keeper pred sent)
  (accumulate se (every (lambda (wd) (if (pred wd) wd '())) sent)))