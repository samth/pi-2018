#lang slideshow

(require slideshow/step slideshow/code slideshow/face 
         ppict/2
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
        (lambda (ts flow titan)
          (ppict-do full-page
           #:go (coord .5 .5 'cc)
           (cellophane (scale (bitmap "typescript.png") .9) ts)
           #:go (coord .5 .5 'cc)
           (cellophane (scale (bitmap "flow.png") .9) flow)
           #:go (coord .5 .5 'cc)
           (cellophane (scale (bitmap "titan.png") .9) titan))))

(pic "princess.jpg")


(slide (scale (page->pict "popl16-tfgnvf.pdf") 1.8))

(code-colorize-enabled #t)
;(slide (langs-pict #t))

(define (titlet s)
  (t/quat s size2))

