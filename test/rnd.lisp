
(in-package #:auxin-tests)

(plan 1)

; (declaim (notinline 3on-sphere2 3on-sphere-slow))

(veq:fvprogn

  (subtest "rnd" ()

    (rnd:set-rnd-state 1)

    (is (length (rnd:rndspace 10 0f0 10f0)) 10)

    (is (rnd:rndspace 10 0f0 10f0)
        '(1.8467712 7.931614 3.7252033 7.7582145 6.9112134 3.3949196 7.9353485
          8.710781 0.7763338 6.926218))

    (is (rnd:rndspace 10 0f0 10f0 :order t)
        '(0.49096227 0.5477512 0.6882775 3.7043893 4.0890446 4.5915437
          6.2654696 7.5623474 8.383889 8.869057))

    (is (rnd:rndspacei 10 0 10) '(2 4 7 7 9 1 7 0 6 9))
    (is (rnd:rndspacei 10 0 10 :order t) '(0 1 1 3 6 7 8 8 9 9))

    (is (rnd:nrndi 9 4) '(3 2 1 0 2 3 3 2 1))
    (is (rnd:nrnd 11 4f0) '(3.294303 0.2653222 1.5804071 1.5350165 2.317037
                            2.5241246 1.136961 1.4920073 2.2665157 2.6770053 3.3003106))
    (is (rnd:nrnd 12 4f0) '(0.14630604 0.27337027 2.0011544 0.9922395 3.9108887
                            1.2850857 1.9853249 2.3879623 2.2435517 3.5690756 2.3142343 1.7769961))
    (is (rnd:nrnd* 12 4f0) '(2.348384 2.8261738 -3.166296 -3.5078163 -2.537528 2.4612446
                             -0.69782543 -2.4539223 -0.6044054 2.088153 1.9195433 3.6032104))
    (is (rnd:bernoulli 4 0.5f0) '(1.0 1.0 1.0 0.0))

    (is (veq:lst (rnd:2on-line 101f0 204f0 433f0 454f0)) '(241.52104 309.81403))
    (is (veq:lst (f2!@+ 303f0 73f0 (rnd:2on-circ 303f0))) '(433.55383 -200.43134))
    (is (veq:lst (f2!@+ 303f0 73f0 (rnd:2in-circ 303f0))) '(441.35565 -43.934296))

    (is (rnd:2non-line 5 101f0 204f0 433f0 454f0)
        #(427.40457 449.78656 157.03436 246.19455 136.4327 230.68124 144.76556
        236.95601 150.21408 241.0588)
        :test #'equalp)

    (is (f2!@$+ (rnd:2nin-circ 5 20f0) 433f0 454f0)
        #(433.9736 448.2122 439.11932 471.20563 434.0098 443.6098 424.3462
          457.24042 447.47418 462.05017)
        :test #'equalp)

    (is (rnd:nrnd* 10 2f0)
        '(-1.599505 0.44479895 -1.9444766 -1.3134341 1.6751962
          1.6003728 -0.12388039 1.7128291 1.6372342 0.6896429))

    (let ((fx (rnd:2walker-acc 0.5 0.2 0.5 0.3))
          (fx2 (rnd:2walker 0.2 0.4)))
      (is (veq:lst (f@fx 0.2))
          (veq:lst 1.0439396 0.53469574 0.5439396 0.33469573))
      (is (veq:lst (f@fx2 0.3))
          (veq:lst 0.05380459 0.17687196)))

    (locally ; i dont know why rnd::3on-sphere-slow fails here, but
             ; but it works (inlined) other places. could it be something
             ; related to prove?
      (declare (notinline rnd::3on-sphere-slow))
      (is (veq:lst (rnd:3in-box 3f0 4f0 5f0)) '(2.6423843 2.61512 -2.6625085))
      (is (veq:lst (rnd:2in-rect 30f0 40f0)) '(-18.40823 33.473892))
      (is (veq:lst (rnd::3on-sphere-slow)) '(-0.15089655 0.9546907 -0.25650752))
      (is (veq:lst (rnd:3on-sphere)) '(-0.64585245 -0.5678295 -0.51033735)))

    (is (rnd:2nin-rect 4 10f0 8f0) #(-5.907073 6.7704105 3.3858323 3.1264362
                                    -7.100342 -3.5603523 -3.9106321 5.727728)
        :test #'equalp)
    (is (rnd:2nin-square 4 10f0)
        #(-0.032482147 4.4865417 0.9600811 4.947405 -5.332243 2.3918176 5.0531125 4.0900254)
        :test #'equalp)

    (is (rnd:3non-line 4 1f0 2f0 3f0 4f0 5f0 6f0)
         #(2.5056543 3.5056543 4.5056543 3.1236343 4.1236343 5.1236343
           3.0933897 4.0933895 5.0933895 2.5793982 3.5793982 4.579398)
        :test #'equalp)

    (is (rnd:3nin-box 4 1f0 2f0 3f0 )
        #(-0.07971144 -0.85225344 -1.7506342 -0.011153221 -1.4247293 -1.5761018
          -0.85936 1.9066467 1.0387022 -0.9924362 1.0264344 2.1144962)
        :test #'equalp)

    (is (rnd:3non-sphere 4 10f0)
        #(1.2708894 9.808169 -1.4780575 5.3827806 -3.963852 7.437308 7.3314786
          -5.339007 -4.212414 3.5447438 5.343459 -7.673476)
        :test #'equalp)

    (is (rnd:3nin-sphere 4 10f0)
        #(-6.3254714 -5.1921296 0.5189228 -0.5168009 -6.13518 -0.86379766
          -0.9095645 5.3142047 3.8828087 -3.267703 2.3641253 7.947004)
        :test #'equalp)))

(unless (finalize) (error "error in rnd tests"))

