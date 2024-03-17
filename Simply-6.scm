#lang simply-scheme

;; Helpers
(define (square x)
  (* x x))
#;
(define (plural wd)
  (if (equal? (last wd) 'y)
      (word (bl wd) 'ies)
      (word wd 's)))
(define (check-expect exp1 exp2)
  (equal? exp1 exp2))


;; Exercise 6.1

;a
(cond ((= 3 4) '(this boy))
      ((< 2 5) '(nowhere man))
      (else '(two of us)))       ;'(nowhere man)

;b
(cond (empty? 3)
      (square 7)
      (else 9))                  ;3

;c
(define (third-person-singular verb)
  (cond ((equal? verb 'be) 'is)
        ((equal? (last verb) 'o) (word verb 'es))
        (else (word verb 's))))

(third-person-singular 'go)     ;goes


;; Exercise 6.2

;a
(or #f #f #f #t)              ;true
 
;b
(and #f #f #f #t)             ;false

;c
(or (= 2 3) (= 4 3))          ;false

;d
(not #f)                      ;true

;e
(or (not (= 2 3)) (= 4 3))    ;true

;f
(or (and (= 2 3) (= 3 3)) (and (< 2 3) (< 3 4))) ;true

;; Exercise 6.3

(define (sign number)
  (cond ((< number 0) 'negative)
        (else (cond ((= number 0) 'zero)
                    (else 'positive)))))

;; Exercise 6.4
(define (utensil meal)
  (if (equal? meal 'chinese)
      'chopsticks
      'fork))

;; Exercise 6.5
(define (european-time sent)
  (cond ((= 12 (first sent)) (if (equal? 'am (last sent)) 12 24))
        (else (first sent))))

(define (american-time time)
  (cond ((or (> time 24) (< time 1)) '(Invalid Time))
        ((< 12 time) (se time 'pm))
        (else (se time 'am))))

;; Exercise 6.6
(define (teen? num)
  (if (and (>= num 13) (<= num 19))
      #t
      #f))

;; Exercise 6.7
(define (type-of arg)
  (cond ((number? arg)  'NUMBER)
        ((boolean? arg) 'BOOLEAN)
        ((word? arg)    'WORD)
        ((sentence arg) 'SENTENCE)
        (else '(NOT A TYPE DEFINED))))

;; Exercise 6.8
(define (indef-article wd)
  (cond ((member? (first wd) 'aeiou) (se 'an wd))
        (else (se 'a wd))))

;; Exercise 6.9

(define (thismany num wd)
  (cond ((= num 1) (se num wd))
        (else (se num (plural wd)))))

;; Exercise 6.10
(define (sort2 sent)
  (cond ((> (first sent) (last sent)) (se (last sent) (first sent)))
        (else sent)))

;; Exercise 6.11
(define (valid-date? m d y)
  (if  (or (< m 0) (> m 12) (> d 31) (< d 1))
       #f
       (and (> d 0) ( <= d (check-day? m y)))))

; Determine the leap year
(define (29? y)
  (if  (and (or (= (remainder y 400) 0) (not (= (remainder y 100) 0))) (= (remainder y 4) 0))
       #t
       #f))

; Check for month days
(define (check-day? m y)
  (cond ((= 2 m) (if (29? y) 29 28))
        ((member? m '(1 3 5 7 8 10 12)) 31)
        (else 30)))

;; Exercise 6.12

(define (plural wd)
  (cond ((member? (last wd) '(s x z)) (word wd 'es))
        ((member? (word (last (bl wd)) (last wd)) '(ch sh)) (word wd 'es))
        ((and (equal? (last wd) 'y) (member? (last (bl wd)) '(a e i o u))) (word wd 's))
        ((equal? (last wd) 'y) (word (bl wd) 'ies))
        (else (word wd 's))))


;; Exercise 6.13



;; Exercise 6.14

(define (describe-time seconds)
  (cond ((< seconds 60) (se seconds 'SECONDS))
        ((and (>= seconds 60) (< seconds 3600)) (se (/ seconds 60.0) 'MINUTES))
        ((and (>= seconds 3600) (< seconds (* 3600 24))) (se (/ seconds 3600) 'HOURS))
        ((and (>= seconds (* 3600 24)) (< seconds (* (* 3600 24) 7))) (se (/ seconds (* 3600 24)) 'DAYS))))


















