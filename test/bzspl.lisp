
(in-package #:auxin-tests)

(plan 1)


(subtest "bzspl"

  (let ((pts-a (veq:f$_ `((-20.0f0 99.0f0) (0.0f0 1.0f0) (10.0f0 20.0f0) (100.0f0 100.0f0))))
        (pts-b (veq:f$_ `((-20.0f0 99.0f0) (0.0f0 1.0f0) (10.0f0 20.0f0)
                          (100.0f0 100.0f0) (-3.0f0 -17.0f0) (0.0f0 4.0f0))))
        (pts-c (veq:f$_ `((-32.0f0 79.0f0) (0.3f0 3.0f0) (10.1f0 25.0f0)))))

    (is (bzspl:pos* (bzspl:make pts-c) (math:linspace 5 0f0 1f0))
        (veq:f$_ `((-32.0f0 79.0f0) (-17.256249999999998f0 47.125f0)
                   (-5.324999999999999f0 27.5f0) (3.7937499999999993f0 20.125f0)
                   (10.1f0 25.0f0)))
        :test #'equalp)

    (is (bzspl:pos* (bzspl:make pts-c :closed t) (math:linspace 5 0f0 1f0))
        #(-15.85 41.0 2.0468752 11.5625 3.6125004 29.0 -19.15 61.4375 -15.85 41.0)
        :test #'equalp)

    (is (bzspl:pos* (bzspl:make pts-a) (math:linspace 10 0f0 1f0))
        #(-20.0 99.0 -11.851851 60.75309 -5.185185 33.12346 2.3841858e-7 16.11111
                3.7037039 9.716048 7.1604953 13.481483 17.77778 24.666668
                36.790127 42.81482 64.19753 67.92593 100.0 100.0)
         :test #'equalp)

    (is (bzspl:pos* (bzspl:make pts-b) (math:linspace 10 0f0 1f0))
         #(-20.0 99.0 -5.185185 33.12346 3.7037039 9.716048 12.777779 20.222223
                 36.97531 43.728394 70.23457 72.91358 72.11111 69.55556 37.72839
                 29.481476 8.098764 1.0370363 0.0 4.0)
        :test #'equalp)

    (is (bzspl:pos* (bzspl:make pts-a :closed t) (math:linspace 10 0f0 1f0))
        #(-10.0 50.0 -2.0987654 18.0 3.8271606 9.111111 12.777779 20.222223
                36.97531 43.728394 69.81482 75.77778 68.33333 95.33334 27.530859
                98.79012 -5.0617294 83.9753 -10.0 50.0)
        :test #'equalp)

    (is (bzspl:pos* (bzspl:make pts-b :closed t) (math:linspace 10 0f0 1f0))
        #(-10.0 50.0 1.1111113 10.666667 12.777779 20.222223 55.0 60.0 72.11111
                69.55556 20.055546 10.166655 -1.5 -6.5 -4.611115 23.944466
                -14.444447 72.44444 -10.0 50.0)
        :test #'equalp)

    (rnd:set-rnd-state 1) ; adaptive pos uses rnd

    (is (bzspl:adaptive-pos (bzspl:make (veq:f$_ '((0f0 0f0) (1f0 2f0) (-3f0 5f0)))))
        #(0.0 0.0 0.16016318 0.4552229 0.061584443 1.5997658 -0.730351 2.924048
          -1.6596264 3.8952951 -3.0 5.0)
        :test #'equalp)

    (is (bzspl:adaptive-pos (bzspl:make (veq:f$_ '((0f0 0f0) (1f0 2f0) (-3f0 5f0))) :closed t))
        #(0.5 1.0 0.52988994 1.8024418 0.20320112 2.3758316 -0.8443723 3.38109
          -1.6050373 3.9095097 -2.1377919 3.9621549 -2.0189571 3.4709005 -1.0625432
          1.8142115 -0.3262586 0.9360465 0.15631074 0.71509457 0.5 1.0)
        :test #'equalp)
    (is (bzspl:len (bzspl:make pts-a)) 225.00311)
    (is (bzspl:len (bzspl:make pts-a :closed t)) 275.0494)))

(unless (finalize) (error "error in bzspl tests"))

