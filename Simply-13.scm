#lang simply-scheme

;; Exercise 13.1

(define (explode wd)
  (if (empty? wd)
      '()
      (se (first wd) (explode (bf wd)))))

(explode 'ape)
  (explode 'pe)      ;first recursive call
    (explode 'e)     ;second recursive call
      (explode "")   ;third recursive call
      '()
    '(e)
  '(p e)
'(a p e)

;; Exercise 13.2

(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))


; (pigl 'throughout) -> 'hroughoutt gives it to first
; first pigl-specialist   (pigl 'hroughoutt) -> 'roughoutth gives it to second
; second pigl-specialist  (pigl 'roughoutth) -> 'oughoutthr gives it to third
; third pigl-specialist   (pigl 'oughoutthr) -> 'oughoutthray returns

;; Exercise 13.3

(define (downup wd)
  (if(empty? wd)
     '()
     (se wd (downup (bl wd)) wd)))

;; Base case is missing
;(if (empty? wd)
;    '())
;;cause of Scheme trying to take bl of empty word

;; Exercise 13.4
#;
(define (forever n)
  (if (= n 0)
      1
      (+ 1 (forever n))))

;; n is not reducing to base case
;; infinite loop
;; correct version
(define (forever n)
  (if (= n 0)
      1
      (+ 1 (forever (- n 1)))))

;; Exercise 13.5

;; Alonzo hires Patricia ang gives her 'smile
;; The reason that does not work with downup cause of the base case
;; and also Patricia cant hold every word in her memory twice begining and end
;; that would be hard. Thus she need other little-people (like everybody :))

;; Exercise 13.6

(define (factorial n)
  (if (< n 2)
      1
      (* n (factorial (- n 1)))))

(factorial 6)
  (factorial 5)
    (factorial 4)
      (factorial 3)
        (factorial 2)
          (factorial 1)
          1
        2
      6
    24
  120
720

;; We can write factorial computation as
(* 6 (* 5 ( * 4 (* 3 (* 2 1)))))
;; Thus (factorial 3) waiting (factorial 2) to finish.