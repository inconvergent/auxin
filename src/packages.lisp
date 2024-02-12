
(defpackage #:auxin
  (:use #:common-lisp)
  (:import-from #:veq #:awf #:awg #:group #:ungroup #:aif #:abbrev #:mvc #:mvb #:dsb)
  (:export
   #:d? #:i? #:v?
   #:*eps* #:*opt* #:*srndopt* #:small-ind
   #:cmd-args #:terminate #:internal-path-string #:define-struct-load-form
   #:abbrev #:awg #:awf #:aif #:awf #:awg #:dsb #:mvb #:mvc
   #:append-number #:ensure-filename
   #:gi #:me #:ki
   #:kv #:tl #:tav #:tv #:vl #:it #:ev
   #:make-animation #:animate #:mmss #:wheel #:iter-timer
   #:mkstr #:psymb #:symb #:reread
   #:now #:numshow #:print-every
   #:show-ht
   #:split
   #:string-list-concat
   #:lvextend #:make-adjustable-vector #:to-adjustable-vector #:ensure-vector
   #:last* #:lst>n #:psh #:to-list #:to-vector #:vextend #:undup
   #:vector-first #:vector-last
   #:with-struct #:with-fast-stack))

(defpackage #:fn (:use #:common-lisp) (:export #:fn #:seed))

(defpackage #:parallel (:use #:common-lisp)
  (:export #:create-channel #:end #:info #:init))

(defpackage #:ortho
  (:use #:common-lisp)
  (:export #:export-data #:import-data #:make #:make-rayfx #:pan-cam #:pan-xy
           #:project #:project* #:project-offset #:project-offset* #:rotate
           #:update #:zoom
           #:@cam #:@vpn #:@xy #:@up)
  (:import-from #:auxin #:*opt* #:with-struct))

(defpackage #:math
  (:use #:common-lisp)
  (:export #:add #:argmax #:argmin #:close-path #:close-path*
           #:copy-sort #:imod #:integer-search #:last* #:lerp #:lget #:linspace
           #:list>than #:ll-transpose #:lpos #:mod2 #:mult #:nrep #:range
           #:range-search #:sub)
  (:import-from #:auxin #:*opt* #:ensure-vector))

(defpackage #:rnd
  (:use #:common-lisp)
  (:export
    #:make-rnd-state #:set-rnd-state
    #:2in-circ #:2in-rect #:2in-square #:2nin-circ
    #:2nin-rect #:2nin-square #:2non-circ #:2non-line #:2non-line*
    #:2on-circ #:2on-line #:2on-line*
    #:2walker #:2walker-acc
    #:3in-box #:3in-cube #:3in-sphere
    #:3nin-box #:3nin-cube #:3nin-sphere
    #:3non-line #:3non-line* #:3non-sphere
    #:3on-line #:3on-line* #:3on-sphere
    #:3walker #:3walker-acc
    #:norm #:bernoulli #:2ndistsample #:max-distance-sample
    #:nrnd #:nrnd* #:nrnd-from #:nrnd-from* #:nrndi #:nrndrng #:nrndrngi
    #:prob #:prob* #:rcond #:either
    #:rep #:rnd #:rnd* #:rndget #:shuffle
    #:rndi #:rndrng #:rndrngi #:array-split
    #:rndspace #:rndspacei
    #:walker #:walker-acc)
  (:import-from #:auxin #:*opt* #:mvb #:ensure-vector #:make-adjustable-vector
                #:to-vector #:vextend))

(defpackage #:srnd
  (:use #:common-lisp)
  (:export #:2in-circ #:2on-circ #:2in-circ+ #:2on-circ+
           #:3in-sphere #:3on-sphere #:3in-sphere+ #:3on-sphere+
           #:rnd #:rnd* #:rndrng #:make #:srnd #:prob #:rcond)
  (:import-from #:auxin #:*srndopt*))

(defpackage #:state
  (:use #:common-lisp)
  (:export #:awith #:it #:lget #:lset #:make #:sget #:to-list #:with))

(defpackage #:pigment
  (:use #:common-lisp)
  (:export #:rgb #:make #:scale #:scale!
           #:copy
           #:with #:with*
           #:as-list* #:as-val #:as-val*
           #:black #:dark #:gray #:vdark #:white #:cyan #:mdark
           #:green #:yellow #:red #:blue #:magenta
           #:transparent
           #:hsv #:cmyk #:as-hex #:as-hsv #:as-list)
  (:import-from #:auxin #:*opt* #:ensure-vector #:awg))

(defpackage #:hset
  (:use #:common-lisp)
  (:export #:add #:add* #:copy #:del #:del* #:inter #:make #:mem
           #:mem* #:num #:symdiff #:uni #:to-list)
  (:import-from #:auxin #:*opt*))

(defpackage #:bzspl
  (:use #:common-lisp)
  (:export #:adaptive-pos #:len #:make #:pos #:pos* #:rndpos)
  (:import-from #:auxin #:*opt* #:make-adjustable-vector #:to-list
                #:with-struct))

(defpackage #:pth
  (:use #:common-lisp)
  (:export #:@dim #:@n #:@ns #:pth #:@closed #:@len #:make #:@pts
           #:prt #:pos #:lpos
           #:stipple #:arc)
  (:import-from #:auxin #:*opt* #:with-struct))

(defpackage #:simplify
  (:use #:common-lisp)
  (:export #:path)
  (:import-from #:auxin #:*opt* #:make-adjustable-vector #:vextend))

; (defpackage #:hatch
;   (:use #:common-lisp)
;   (:export #:hatch #:stitch)
;   (:import-from #:auxin #:*opt* #:ensure-vector #:vector-last
;                 #:make-adjustable-vector #:to-list #:vextend))

(defpackage #:jpath
  (:use #:common-lisp)
  (:export #:jpath #:path->joints #:path->diagonals #:make-limits)
  (:import-from #:auxin #:*opt* #:ensure-vector #:make-adjustable-vector
                #:to-adjustable-vector #:to-list #:to-vector #:vextend))

(defpackage #:dat
  (:use #:common-lisp)
  (:export #:do-lines-as-buffer #:export-data #:import-data #:import-all-data)
  (:import-from #:auxin #:*opt* #:ensure-filename))

(defpackage #:gridfont
  (:use #:common-lisp)
  (:export #:make #:nl #:update #:wc)
  (:import-from #:auxin #:*opt* #:ensure-filename
                #:internal-path-string #:with-struct))

(defpackage #:wsvg
  (:use #:common-lisp)
  (:export #:*half-long* #:*half-short* #:*long* #:*short* #:bzspl #:carc
           #:circ #:compound #:draw #:wcirc #:hatch #:jpath #:make #:make*
           #:path #:rect #:save #:square #:update #:wpath #:sign
           #:u->mm #:mm->u)
  (:import-from #:auxin #:dsb #:ensure-filename #:with-struct))

(defpackage #:wsvg/qry
  (:use #:common-lisp)
  (:import-from #:veq #:dsb #:strip-arg-keys #:get-arg-key)
  (:export #:selectors))

(defpackage #:canvas
  (:use #:common-lisp)
  (:export #:canvas #:make #:save #:set-gray-pix #:set-pix)
  (:import-from #:auxin #:*opt* #:small-ind #:awg))

