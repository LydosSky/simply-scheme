#lang simply-scheme

;; Helpers
(define (vowel? char)
  (member? char '(a e i o u)))

;; Exercise 7.1

(define (gertrude wd)
  (let ((repeated (se (word (if (vowel? (first wd)) 'an 'a)) wd)))
        (se repeated
            'is
            repeated
            'is
            repeated)))

;; Exercise 7.2

(let ((pi 3.14159)
      (pie '(lemon meringue)))
  (se '(pi is) pi '(but pie is) pie))

;; Exercise 7.3

(define (superlative adjective wd)
  (se (word adjective 'est) wd))

; Sample run
#;
(superlative 'dumb 'exercise)

;; Exercise 7.4

(define (sum-square a b)
  (let ((+ *)
        (* +))
    (* (+ a a) (+ b b))))

; It works as expected but
; * operators act as +
; + operators act as *
 