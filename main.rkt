#lang slideshow

(require slideshow/step slideshow/code slideshow/face 
         unstable/gui/ppict unstable/gui/pslide
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
        (scale (bitmap "Murder_mystery2_large.png") 1))


(pic "princess.jpg")

(pic "typescript.png" .9)

(slide (scale (page->pict "popl16-tfgnvf.pdf") 1.8))

(code-colorize-enabled #t)
;(slide (langs-pict #t))

(define (titlet s)
  (t/quat s size2))

