#lang slideshow

(require slideshow/step slideshow/code slideshow/face 
         ppict/2 pict/shadow
         (only-in slideshow/slide title-size)
         "config.ss"
         (except-in "beamer.ss" title) "lib.ss" "thanks.ss" 
         "tslide.ss" "stages.rkt"
         "helper.rkt" pdf-read
         racket/runtime-path rsvg
         (except-in mzlib/etc identity)
         unstable/gui/slideshow)

(current-title-background-pict  (pin-over
                                 ;(pin-over
                                  (current-background-pict)
                                 ;300 200
                                 ;; (cellophane (bitmap
                                 ;;              (load-svg-from-file
                                 ;;               "Indiana_University_seal.svg" 5))
                                 ;;             0.1))
                                 -300 000
                                 (cellophane (bitmap
                                              (load-svg-from-file
                                               "racket-logo.svg" 2))
                                             0.3)))
                                 
(title `("Sound Gradual Typing")
        `("Only Mostly Dead")
        `(("Spenser Bauman" "Mathworks")
         ("Carl Friedrich Bolz-Tiereck" "Heinrich-Heine-Universität Düsseldorf")
         ("Jeremy Siek" "Indiana University")
          ("Sam Tobin-Hochstadt" "Indiana University"))
        "OOPSLA 2017")

(define (pic fname [r 1])
  (pslide #:go (coord .5 .5 'cc)
          (scale (bitmap fname) r)))

(pslide #:go (coord .5 .5 'cc)
        (scale (bitmap "Murder_mystery2_large.png") 1)
        #:go (coord .05 .5 'lc)
        (t/kau "A" size1)
        (t/kau "Murder" size1)
        (t/kau "Mystery" size1))



(slide #:layout 'center
       (vc-append
        (t/cant "2006" size1)
        (ht-append (scale (page->pict "siek06__gradual.pdf") .7)
                   (scale (page->pict "dls06-tf.pdf") .7))
        (t/cant "Sound Gradual Typing" size1)))


(require slideshow/play)

(play-n #:layout 'center
        #:skip-first? #t
        (λ (ts flow titan unsound)
          (ppict-do full-page
           #:go (coord .5 .5 'cc)
           (cellophane (scale (bitmap "typescript.png") .9) ts)
           #:go (coord .5 .5 'cc)
           (cellophane (scale (bitmap "flow.png") .9) flow)
           #:go (coord .5 .5 'cc)
           (cellophane (scale (bitmap "titan.png") .9) titan)
           #:go (coord .5 .5 'cc)
           (if (= unsound 1)
               (rotate (shadow-frame (t/cant "All Unsound!" size1)) .5)
               (blank 1)))))

(tslide "But Why?")

(define (quoted author ts)
  (vr-append (apply vl-append (for/list ([t ts])
                                (t/cant t size2)))
             (blank 30)
             (t/kau (string-append "" author) size2)))

(slide (quoted "Vincent St. Amour, Dec. 2015"
               '("Interfacing Typed Racket and Racket code"
                 "may involve a lot of dynamic checks, which"
                 "can have significant overhead, and cause"
                 "that kind of stuttering.")))

(slide (quoted "Neil Toronto, May 2015"
               '("It's very slow."
                 ""
                 "It looks like it has to do with a dc<%>"
                 "instance crossing from untyped to"
                 "typed code.")))


(slide (quoted "John Clements, ..."
               '()))


(pslide
 #:go (coord .5 .0 'ct)
 (scale (page->pict "popl16-tfgnvf.pdf") 1.8)
 #:next
 #:go (coord .5 .5 'cc)
 (shadow-frame
  (vl-append
   (t/cant "The problem is that, according to our measurements,"
           size3)
   (t/cant "the cost of enforcing soundness is overwhelming."
           size3)))
 #:next
 #:go (coord .5 .5 'cc)
 (shadow-frame
  (scale (bitmap "synth.png") .8))
 #:go (coord .5 .5 'cc)
 #:next
 (shadow-frame
  (cc-superimpose
   (blank 1008 450)
   (apply vl-append
          (for/list ([t '("We find that Typed Racket’s cost of"
                          "soundness is not tolerable. If applying"
                          "our method to other gradual type system"
                          "implementations yields similar results,"
                          "then sound gradual typing is dead.")])
            
            (t/cant t size3)))))

 )




(pic "princess.jpg")

(tslide "Enter Pycket")

(pic "aggregate.png" .8)

(slide #:title "Synth, again"
       #:layout 'center
       (bitmap (scale (page->pict "slowdown-synth-warmup-0.pdf") 1.4)))

(slide #:title (t/quat "Two Key Ideas" size2)
 (item (t/cant "Tracing JIT Compilation" size2))
 (blank 125)
 (item (t/cant "Hidden Classes for Chaperones" size2)))

;(code-colorize-enabled #t)

(slide #:layout 'center
 (code (define f (cast #,(red-code (λ (x) (+ x 1)))
                       (-> Integer Integer))))
 'next!
 (arrow 30 (- (/ pi 2)))
 'alts
 (list
  (list
   (code (define (f x*)
           (cast (#,(red-code (λ (x) (+ x 1))) (cast x* Integer))
                 Integer))))
  (list
   (code
    (define f* (checked-fn #,(red-code (λ (x) (+ x 1)))
                          Integer Integer))
    (define (f x*)
      (cast ((checked-fn-call f)
             (cast x* (checked-fn-domain f)))
            (checked-fn-range f)))))))
   

;(slide (langs-pict #t))

(define (titlet s)
  (t/quat s size2))

