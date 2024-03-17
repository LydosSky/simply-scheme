#lang simply-scheme

;; Exercise 12.1

(define (addup nums)
  (if (empty? nums)
      0
      (+ (first nums) (addup (bf nums)))))

;; Exercise 12.2

(define (acronym sent)
  (if (empty? sent)
      ""
      (word (first (first sent))
            (acronym (bf sent)))))

;; Exercise 12.3

; Base case cannot be -1, 0 joins multiplication.
; i.e. (factorial 10) -> 0

(define (factorial num)
  (if (= 0 num)
      1
      (* num (factorial (- num 1)))))

;; Exercise 12.4

(define (f sent)
  (if (empty? sent)
      sent
      (se (f (bf sent)) (first sent))))

;; Exercise 12.5

(define (amplifier wd)
  (cond ((number? wd) (* 2 wd))
        ((equal? wd 'good) 'great)
        ((equal? wd 'bad) 'terrible)
        (else wd)))


(define (exaggerate sent)
  (if (empty? sent)
      sent
      (se (amplifier (first sent))
          (exaggerate (bf sent)))))

;(exaggerate '(i ate 3 popstickers))
;(exaggerate '(the chow fun is good here))

;; Exercise 12.6

(define (base-grade wd)
  (cond ((member? (first wd) '(A a)) 4)
        ((member? (first wd) '(B b)) 3)
        ((member? (first wd) '(C c)) 2)
        ((member? (first wd) '(D d)) 1)
        (else 0)))

(define (grade-modifier wd)
  (cond ((equal?  (bf wd) '+) .33)
        ((equal?  (bf wd) '-) -.33)
        (else 0)))

(define grades '(A A+ B+ B))

;;????????????????????????????
(define (gpa sent)
  (if (empty? sent)
      0
      (+ (+ (base-grade (first sent)) (grade-modifier (first sent)))
         (gpa (bf sent)))))
;;????????????????????????????


;; Exercise 12.7

(define (get-number num)
  (cond ((= num 0) 'zero)
        ((= num 1) 'one)
        ((= num 2) 'two)
        ((= num 3) 'three)
        ((= num 4) 'four)
        ((= num 5) 'five)
        ((= num 6) 'six)
        ((= num 7) 'seven)
        ((= num 8) 'eight)
        ((= num 9) 'nine)))

(define (spell-number num)
  (if (empty? num)
      '()
      (se (get-number (first num))
          (spell-number (bf num)))))

;; Exercise 12.8

(define (numbers sent)
  (if (empty? sent)
      '()
      (se (if(number? (first sent)) (first sent) '())
          (numbers (bf sent)))))

;; Exercise 12.9

(define (real-word? wd)
  (not (member? wd '(a the an in of and for to with))))

(define (real-words sent)
  (if (empty? sent)
      sent
      (se (if (real-word? (first sent)) (first sent) '())
          (real-words (bf sent)))))

;; Exercise 12.10

(define (remove wd sent)
  (if (empty? sent)
      '()
      (se (if(equal? wd (first sent)) '() (first sent))
          (remove wd (bf sent)))))

;; Exercise 12.11

(define (count sent)
  (if (empty? sent)
      0
      (+ 1 (count (bf sent)))))

;; Exercise 12.12

(define (roman-value letter)
  (cond ((member? letter '(i I)) 1)
        ((member? letter '(v V)) 5)
        ((member? letter '(x X)) 10)
        ((member? letter '(l L)) 50)
        ((member? letter '(c C)) 100)
        ((member? letter '(d D)) 500)
        ((member? letter '(m M)) 1000)
        (else 'huh?)))

(define (compare s1 s2)
  (if (>= (roman-value s1) (roman-value s2))
      (roman-value s1)
      (- (roman-value s1))))

(define (arabic wd)
  (if (empty? wd)
      0
      (+ (if (empty?  (bf wd))
             (roman-value wd)
             (compare (first wd) (first (bf wd)))) 
         (arabic (bf wd)))))

;; Exercise 12.13

;60         seconds -> 1 minute
;3600       seconds -> 1 hour
;86400      seconds -> 1 day
;604800     seconds -> 1 week
;31557600   seconds -> 1 year
;3155760000 seconds -> 1 century

(define (get-time sec)
  (cond ((>= sec 3155760000) (se (floor (/ sec 3155760000)) 'Centuries))
        ((>= sec 31557600)   (se (floor (/ sec 31557600))       'Years))
        ((>= sec 604800)     (se (floor (/ sec 604800))         'Weeks))
        ((>= sec 86400)      (se (floor (/ sec 86400))           'Days))
        ((>= sec 3600)       (se (floor (/ sec 3600))           'Hours))
        ((>= sec 60)         (se (floor (/ sec 60))           'Minutes))
        (else (se sec 'Seconds))))

(define (rest sec)
  (cond ((>= sec 3155760000) (remainder sec 3155760000))
        ((>= sec 31557600)   (remainder sec 31557600))
        ((>= sec 604800)     (remainder sec 604800))
        ((>= sec 86400)      (remainder sec  86400))
        ((>= sec 3600)       (remainder sec 3600))
        ((>= sec 60)         (remainder sec 60))
        (else sec)))


(define (describe-time sec)
  (if (< sec 60)
      (get-time sec)
      (se (get-time sec)
          (describe-time (rest sec)))))
     