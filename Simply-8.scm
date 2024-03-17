#lang simply-scheme

;; Helpers
(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (square x)
  (* x x))


;; Exercise 8.1
(every last '(algebra purple spaghetti tomato gnu))                ; '(a e i o u) 

(keep number? '(one two three four))                               ; '()

(accumulate * '(6 7 13 0 9 42 17))                                 ; 0

(member? 'h (keep vowel? '(t h r o a t)))                          ; false 

(every square (keep even? '(87 4 7 12 0 5)))                       ; '(16 144 0)

(accumulate word (keep vowel? (every first '(and i love her))))    ; 'ai

((repeated square 0) 25)                                           ; 1

(every (repeated bl 2) '(good day sunshine))                       ; '(goo d sunshi)

;; Exercise 8.2

(keep vowel? 'birthday)

(every first '(golden slumbers))

(first '(golden slumbers))
 
(every last '(little child))

(accumulate word (every last '(little child)))

(every + '(2 3 4 5))

(accumulate + '(2 3 4 5))

;; Exercise 8.3

(define (f a)
  (keep even? a))
; Sentence of Numbers -> Sentence of Numbers
; Finds Even numbers inside Sentence of Numbers

(define (g b)
  (every b '(blue jay way)))
; A Function to apply Word -> Sentence
; Applies given function to every word of sentence

(define (h c d)
  (c (c d)))
; A function and a data -> function applied to data i.e. (number -> number)
; Applies c function to d two times

(define (i e)
  (/ (accumulate + e) (count e)))
; Number -> Number
; + operator on every digit of e and divides that with count of e digits

accumulate
; function and an argument to that function -> function applied and accumulated to a result
; for example + '(1 2 3 4) producess 10

sqrt
; Number -> Number (9 -> 3) (25 -> 5)
; square root of a positive integer

repeated
; takes a function and number -> num*function as function
; for example ((repeated bf 3) 'hello) -> lo

(repeated sqrt 3)
; Returns a procedure that take sqrt 3 time of a given number
; i.e. ((repeated sqrt 3) 16)

(repeated even? 2)
; Error After first even?

(repeated first 2)
; Sentence or Word -> Sentence or Word
; ((repeated first 2) 'hello)  -> 'h

#;
((repeated (repeated bf 3) 2) '(hello world))
; Error After first repeated

;; Exercise 8.4

(define (choose-beatles predicate)
  (keep predicate '(John Paul George Ringo)))

(define (ends-vowel? wd) (vowel? (last wd)))

(define (even-count? wd) (even? (count wd)))

;; Exercise 8.5

(define (transform-beatles fn)
  (every fn '(John Paul George Ringo)))

(define (amazify name)
  (word 'the-amazing- name))

;; Exercise 8.6

(define (LtoC letter)
  (cond ((equal? 'a letter) 'Alfa)
        ((equal? 'b letter) 'Bravo)
        ((equal? 'c letter) 'Charlie)
        ((equal? 'd letter) 'Delta)
        ((equal? 'e letter) 'Echo)
        ((equal? 'f letter) 'Foxtrot)
        ((equal? 'g letter) 'Golf)
        ((equal? 'h letter) 'Hotel)
        ((equal? 'i letter) 'India)
        ((equal? 'j letter) 'Juliett)
        ((equal? 'k letter) 'Kilo)
        ((equal? 'l letter) 'Lime)
        ((equal? 'm letter) 'Mike)
        ((equal? 'n letter) 'November)
        ((equal? 'o letter) 'Oscar)
        ((equal? 'p letter) 'Papa)
        ((equal? 'q letter) 'Quebec)
        ((equal? 'r letter) 'Romeo)
        ((equal? 's letter) 'Sierra)
        ((equal? 't letter) 'Tango)
        ((equal? 'u letter) 'Uniform)
        ((equal? 'v letter) 'Victor)
        ((equal? 'w letter) 'Whiskey)
        ((equal? 'x letter) 'Xray)
        ((equal? 'y letter) 'Yankee)
        ((equal? 'z letter) 'Zulu)))

(define (words sent)
  (se (every LtoC sent)))

;; Execise 8.7

(define (letter-count sent)
  (accumulate + (every count sent)))

;; Exercise 8.8

(define (amplifie wd)
  (cond ((number? wd) (* 2 wd))
        ((equal? 'good wd) 'great)
        ((equal? 'bad wd) 'terrible)
        (else wd)))

(define (exaggerate sent)
  (every amplifie sent))

;; Exercise 8.9
;(every  '(hello world))

(keep word? '(hello world))

(accumulate se '(hello world))

;; Exercise 8.10

(define (true-for-all predicate sent)
  (= (count sent) (count (keep predicate sent))))

;; Exercise 8.11
(define (base-grade grade)
  (cond ((equal? 'A (first grade)) 4)
        ((equal? 'B (first grade)) 3)
        ((equal? 'C (first grade)) 2)
        ((equal? 'D (first grade)) 1)
        (else 0)))

(define (grade-modifier grade)
  (cond
    ((member? grade '(A+ A))     0)
    ((equal? '+ (last grade))  .33)
    ((equal? '- (last grade)) -.33)
    (else 0)))

(define (gpa sent)
  (/ (+ (accumulate + (every base-grade sent)) (accumulate + (every grade-modifier sent)))
     (count sent)))

;; Exercise 8.12
(define (count-ums sent)
  (define (um? wd)
    (equal? 'um wd))
  (count (keep um? sent)))

;; Exercise 8.13

(define (convert letter)
  (cond ((member? letter '(a b c A B C)) 2)
        ((member? letter '(d e f D E F)) 3)
        ((member? letter '(g h i G H I)) 4)
        ((member? letter '(j k l J K L)) 5)
        ((member? letter '(m n o M N O)) 6)
        ((member? letter '(p q r s P Q R S)) 7)
        ((member? letter '(t u v T U V)) 8)
        ((member? letter '(w x y z W X Y Z)) 9)
        (else 0)))
        
(define (phone-unspell wd)
  (se (every convert wd)))

;; Exercise 8.14

(define (subword wd start end)
  ((repeated bl (- (count wd) end))
   (word ((repeated bf (- start 1))
          wd))))