#lang simply-scheme

;; Exercise 14.1

(define (remove-once wd sent)
  (if (empty? wd)
      (bf sent)
      (if (equal? wd (first sent))
          (remove-once '() sent)
          (se (first sent) (remove-once wd (bf sent))))))


;(remove-once 'morning '(good morning good morning))

;; Exercise 14.2

(define (up wd)
  (if (empty? wd)
      '()
      (se (up (bl wd)) wd)))

;(up 'town)

;; Exercise 14.3
(define (remdup sent)
  (if (empty? sent)
      '()
      (se (remdup (bf sent))
          (remdup-helper (first sent) (bf sent)))))


(define (remdup-helper wd sent)
  (if (member? wd sent)
      '()
      wd))
     

;(remdup '(ob la di ob la da))

;; Exercise 14.4

(define (odds sent)
  (if (= (count sent) 1)
      sent
      (if (odd? (count sent))
          (se (first sent)
              (odds (bf sent)))
          (odds (bf sent)))))

;(odds '(i lost my little girl))


;; Exercise 14.5

(define (letter-count sent)
  (if (empty? sent)
      0
      (+ (count (first sent))
         (letter-count (bf sent)))))

;(letter-count '(fixing a hole))

;; Exercise 14.6

(define (member-? wd sent)
  (cond ((empty? sent) #f)
        ((equal? wd (first sent)) #t)
        (else (member-? wd (bf sent)))))

;; Exercise 14.7

(define (differences sent)
  (if (= 1 (count sent))
      '()
      (se (- (first (bf sent)) (first sent))
          (differences (bf sent)))))

;(differences '(4 23 9 87 6 12))

;; Exercise 14.8

(define (expand sent)
  (cond ((empty? sent) '())
        ((number? (first sent))
         (expand-helper (first sent)  (bf sent)))
        (else (se (first sent) (expand (bf sent))))))

(define (expand-helper num sent)
  (if (= 0 num)
      (expand (bf sent)) ;;??????? it works but ... :)
      (se (first sent)
          (expand-helper (- num 1) sent))))
          
              

  

;(expand '(4 calling birds 3 french hens))
;(expand '(the 7 samurai))

;; Exercise 14.9

(define (location wd sent)
  (cond ((not (member? wd sent)) #f)
        (else (location-helper 1 wd sent))))

(define (location-helper n wd sent)
  (if (equal? wd (first sent))
      n
      (location-helper (+ n 1) wd (bf sent))))

;(location 'me '(me and you forever))

;; Exercise 14.10

(define (count-adjacent-duplicates sent)
  (if (= (count sent) 1)
      0
      (+ (count-adjacent-duplicates-helper sent)
         (count-adjacent-duplicates (bf sent)))))

(define (count-adjacent-duplicates-helper sent)
  (if (equal? (first sent) (first (bf sent)))
      1
      0))

;(count-adjacent-duplicates '(y a b b a d a b b a d o o))
;(count-adjacent-duplicates '(yeah yeah yeah))

;; Exercise 14.11

(define (remove-adjacent-duplicates sent)
  (cond ((equal? (count sent) 1) sent)
        ((equal? (first sent) (first (bf sent)))
         (se '()
             (remove-adjacent-duplicates (bf sent))))
        (else (se (first sent) (remove-adjacent-duplicates (bf sent))))))
        
      

;(remove-adjacent-duplicates '(y a b b a d a b b a d o o))
;(remove-adjacent-duplicates '(yeah yeah yeah))

;; Exercise 14.12

(define (progressive-squares? sent)
  (cond ((= (count sent) 1) #t)
        ((= ((lambda (x) (* x x)) (first sent))
            (first (bf sent)))
         (and #t (progressive-squares? (bf sent))))
        (else (and #f (progressive-squares? (bf sent))))))


;(progressive-squares? '(3 9 81 6561))
;(progressive-squares? '(25 36 49 64))

;; Exercise 14.13

(define (pigl wd)
  (cond ((check-for-vowels? wd) (word wd 'ay)) 
        ((member? (first wd) 'aeiou) (word wd 'ay))
        (else (pigl (word (bf wd) (first wd))))))

(define (check-for-vowels? wd)
  (cond ((member? 'a wd) #f)
        ((member? 'e wd) #f)
        ((member? 'i wd) #f)
        ((member? 'o wd) #f)
        ((member? 'u wd) #f)
        (else #t)))

;(pigl 'frazzmlpt)

;; Exercise 14.14

(define (same-shape? sent1 sent2)
  (if (and (= (count sent1)
              (count sent2))
           (same-shape-helper sent1 sent2))
      #t
      #f))

(define (same-shape-helper sent1 sent2)
  (if (empty? sent1)
      #t
      (and (= (count (first sent1)) (count (first sent2)))
           (same-shape-helper (bf sent1) (bf sent2)))))
           
(same-shape? '(the fool on the hill) '(you like me too much))
(same-shape? '(the fool on the hill) '(and your bird can sing))


;; Exercise 14.15

(define (merge sent1 sent2)
  (cond ((empty? sent2) sent1)
        ((empty? sent1) sent2)
        ((<= (first sent1) (first sent2))
         (se (first sent1)
             (merge (bf sent1) sent2)))
        (else (se (first sent2)
                  (merge sent1 (bf sent2))))))

;(merge '(4 7 18 40 99) '(3 6 9 12 24 36 50))

;; Exercise 14.16

(define (syllables wd)
  (cond ((empty? wd) 0)
        ((and (vowel? (first wd)) (vowel? (first (bf wd))))
         (+ 1 (syllables (bf (bf wd)))))
        ((vowel? (first wd)) (+ 1 (syllables (bf wd))))
        (else (syllables (bf wd)))))     

(define (vowel? l)
  (member? l '(a e i o u)))




