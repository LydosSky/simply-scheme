#lang simply-scheme

;; helpers
(define (second str)
  (first (bf str)))
(define (square x)
  (* x x))


;; Exercise 5.1
(se 'I '(me mine))            ;'(I me mine)

(se '() '(is empty))          ;'(is empty)

(word '23 '45)                ;'2345

(se '23 '45)                  ;'(23 45)

(bf 'a)                       ;""

(bf '(aye))                   ;'()

(count (first '(maggie mae))) ;6

(se "" '() "" '())            ;'("" "")

(count (se "" '() "" '()))    ;2

;; Exercise 5.2

(define (f1 str1 str2)
  (se (bf str1) (bl str2)))

(define (f2 str1 str2)
  (se (bf str1) (bf str2) (word (first str1) (last str2))))

(define (f3 str1 str2)
  (se str1 str1))

(define (f4 str1 str2)
  (word (second str1) (second str2)))

;; Exercise 5.3
(first 'mezzanine)   ; Returns m
(first '(mezzanine)) ; Returns 'mezzanine
; First one is a symbol thus gives back m
; Second one is a sentence thus gives back first word in it

;; Exercise 5.4
(first  (square 7)) ; Number
(first '(square 7)) ; Sentence

; First process gives back 4
; Second process gives back the 'square

;; Exercise 5.5
(word 'a 'b 'c)  ;Gives back 'abc
(se 'a 'b 'c)    ;Gives back '(a b c)

;First process gives back 'abc
;First process gives back '(a b c)

;; Exercise 5.6
(bf 'zabadak)
(butfirst 'zabadak)

; Nothing special about they
; both returns same values

;; Exercise 5.7
(bf 'x)    ; Gives back ""
(bf '(x))  ; Gives back '()

;; Exercise 5.8
'(here, there and everywhere)            ; not legal ","
'(help!)                                 ; not legal "!"
'(all i've got to do)                    ; not legal '
'(you know my name (look up the number)) ; legal

;; Exercise 5.9
(se (word (bl (bl (first '(make a))))
          (bf (bf (last '(baseball mitt)))))
    (word (first 'with) (bl (bl (bl (bl 'rigidly))))
          (first 'held) (first (bf 'sticthes))))

(se (word (bl (bl 'bring)) 'a (last 'clean))
    (word (bl (last '(baseball hat))) (last 'for) (bl (bl 'very))
          (last (first '(sunny days)))))

;; Exercise 5.10
(butfirst '(hello world))

;; Exercise 5.11
(last '(hello world))

;; Exercise 5.12
(bf '(a)) 
(bl '(a))
; butfirst and butlast can return empty word
; same functions also return empty sentence

;; Exercise 5.13
''banana         ; quote of 'banana
(first ''banana) ; gives back quote

;; Exercise 5.14
(define (third sent)
  (item 3 sent))

;; Exercise 5.15
(define (first-two sent)
  (word (first sent) (first (bf sent))))

;; Exercise 5.16
(define (two-first str1 str2)
  (word (first str1) (first str2)))

(define (two-first-sent sent)
  (word (first (first sent)) (first (second sent))))

;; Exercise 5.17
(define (knight sent)
  (se 'sir sent))

;; Exercise 5.18
(define (ends wd)
  (word (first wd) (last wd)))

(ends 'john)

;; Exercise 5.19
(define (insert-and sent)
  (se (bl sent) 'and (last sent)))

;; Exercise 5.20
(define (middle-names sent)
  (se (bl (bf sent))))

;; Exercise 5.21
(define (query sent)
  (se (second sent) (first sent) (bl (bf (bf sent))) (word (last sent)'?)))