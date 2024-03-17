#lang simply-scheme

;suits of deck
; - hearts
; - diamonds
; - clubs
; - spades
;
;Each hands contains 13 cards.
;Point distrubition
; - Ace    is 4 points
; - King   is 3 points
; - Queen  is 2 points
; - Jack   is 1 point
; - Others is 0 point
;
;- Two cards of a particular suit        1 extra point
;- Only one card of particular suit      2 extra points
;- A void no cards in a particular suit, 3 extra points
;
;;; Example hand
;(sa s10 s7 s6 s2 hq hj h9 ck c4 dk d9 d3)
;This hand is worth 14 points,
; - ace of spades    (sa   ) 4 points
; - queen of hearts  (qh   ) 2 points
; - jack of hearts   (hj   ) 1 point
; - king of clubs    (ck   ) 3 points
; - king of diamonds (dk   ) 3 points
; - only two clubs   (ck c4) 1 point

;; ------ Card-val ------
;; Word -> Number
;; Takes a single card as its argument
;; and returns the value of the card.
(define (card-val card)
  (cond ((equal? 'a (bf card)) 4)
        ((equal? 'k (bf card)) 3)
        ((equal? 'q (bf card)) 2)
        ((equal? 'j (bf card)) 1)
        (else 0)))

; tests
(= (card-val 'cq) 2)
(= (card-val 's7) 0)
(= (card-val 'ha) 4)

;; ------ High-card-points ------
;; Sentence -> Number
;; Takes a hand as its argument and returns the total
;; number of points from high cards in the hand.

(define (high-card-points hand)
  (accumulate + (every card-val hand)))

; tests
(= (high-card-points '(sa s10 hq ck c4)) 9)
(= (high-card-points '(sa s10 s7 s6 s2 hq hj h9 ck c4 dk d9 d3)) 13)

;; ------ Count-suit ------
;; Word Sentence -> Number
;; Takes a suit and a hand as arguments and returns
;; the number of cards in the hand with the given suit

(define (count-suit suit hand)
  (count (keep (lambda (x) (equal? suit (first x))) hand)))

; tests
(= (count-suit 's '(sa s10 hq ck c4)) 2)
(= (count-suit 'c '(sa s10 s7 s6 s2 hq hj h9 ck c4 dk d9 d3))  2)
(= (count-suit 'd '(h3 d7 sk s3 c10 dq d8 s9 s4 d10 c7 d4 s2)) 5)

;; ------ Suit-counts ------
;; Sentence -> Sentence
;; Takes a hand as its argument and returns a sentece
;; containing the number of spades, the number of hearts,
;; the number of clubs, and the number of diamonds in the hand.

(define (suit-counts sent)
 (se (every (lambda (x) (count-suit x sent)) '(s h c d))))
     


; test
(equal? (suit-counts '(sa s10 hq ck c4)) '(2 1 2 0))
(equal? (suit-counts '(sa s10 s7 s6 s2 hq hj h9 ck c4 dk d9 d3))  '(5 3 2 3))
(equal? (suit-counts '(h3 d7 sk s3 c10 dq d8 s9 s4 d10 c7 d4 s2)) '(5 1 2 5))

;; ------ Suit-dist-points ------
;; Number -> Number
;; Takes a number as its argument, interpreting it as
;; the number of cards in a suit. The procedure should
;; return the number of distribution points your hand
;; gets for having that number of cards in a particular suit.

(define (suit-dist-points num)
  (cond ((= num 2) 1)
        ((= num 1) 2)
        ((= num 0) 3)
        (else 0)))


(equal? (suit-dist-points 2) 1)
(equal? (suit-dist-points 7) 0)
(equal? (suit-dist-points 0) 3)

;; ------ Hand-dist-points ------
;; Sentence -> Number
;; Takes a hand as its argument and returns the
;; number of distrubution points the hand is worth.

(define (hand-dist-points sent)
  (accumulate + (every suit-dist-points (suit-counts sent))))
  

(equal? (hand-dist-points '(sa s10 s7 s6 s2 hq hj h9 ck c4 dk d9 d3))  1)
(equal? (hand-dist-points '(h3 d7 sk s3 c10 dq d8 s9 s4 d10 c7 d4 s2)) 3)

;; ------ Bridge-val ------
;; Sentence -> Number
;; Takes a hand as its argument and returns the
;; total number of points that the hand is worth

(define (bridge-val sent)
  (+ (hand-dist-points sent) (high-card-points sent)))


(equal? (bridge-val '(sa s10 s7 s6 s2 hq hj h9 ck c4 dk d9 d3)) 14)
(equal? (bridge-val '(h3 d7 sk s3 c10 dq d8 s9 s4 d10 c7 d4 s2)) 8)