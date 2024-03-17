#lang simply-scheme

;; Problems for You to Try

;;============
(define (explode sent)
  (if (empty? sent)
      '()
      (se (first sent) (explode (bf sent)))))

(explode 'dynamite) ; '(d y n a m i t e)

;;============
(define (letter-pairs sent)
  (if (= 1 (count sent))
      '()
      (se (word (first sent)
                (first (bf sent)))
          (letter-pairs (bf sent)))))


(letter-pairs 'georg) ; '(ge eo or rg ge)


;; Exercise 11.1

(define (downup4 wd)
  (se wd (bl wd) (bl (bl wd)) (first wd) (first (first (bf wd))) (bl wd) wd))

(downup4 'paul)  ;(paul pau pa p pa pau paul)

;; Exercise 11.2

(define (count-ums sent)
  (if (empty? sent)
      0
      (if (equal? 'um (first sent))
          (+ 1 (count-ums (bf sent)))
          (count-ums (bf sent)))))

(count-ums
 '(today um we are going to um talk about the combining um method))
      
      
;; Exercise 11.3

(define (unspell-letter letter)
  (cond ((member? letter 'abc) 2)
        ((member? letter 'def) 3)
        ((member? letter 'ghi) 4)
        ((member? letter 'jkl) 5)
        ((member? letter 'mno) 6)
        ((member? letter 'prs) 7)
        ((member? letter 'tuv) 8)
        ((member? letter 'wxy) 9)
        (else 0)))

(define (phone-unspell wd)
  (if (empty? wd)
      ""
      (word (unspell-letter (first wd))
            (phone-unspell (bf wd)))))


;; Exercise 11.4

;;?????
; Who first said "use what you have to get what you need"?
;;?????


;; Exercise 11.5

(define (initials sent)
  (if (empty? sent)
      '()
      (se (first (first sent))
          (initials (bf sent)))))
  

;; Exercise 11.6

(define (countdown num)
  (if (= 0 num)
      'BLASTOFF!
      (se num (countdown (- num 1)))))

;; Exercise 11.7

(define (copies num wd)
  (if (= num 0)
      '()
      (se wd (copies (- num 1) wd))))