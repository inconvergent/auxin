
(in-package #:auxin-tests)

(plan 3)


(subtest "bzspl"

  (let ((pts-a (veq:f$_ `((-20.0f0 99.0f0) (0.0f0 1.0f0) (10.0f0 20.0f0) (100.0f0 100.0f0))))
        (pts-b (veq:f$_ `((-20.0f0 99.0f0) (0.0f0 1.0f0) (10.0f0 20.0f0)
                          (100.0f0 100.0f0) (-3.0f0 -17.0f0) (0.0f0 4.0f0))))
        (pts-c (veq:f$_ `((-32.0f0 79.0f0) (0.3f0 3.0f0) (10.1f0 25.0f0)))))

    (is-arr (bzspl:pos* (bzspl:make pts-c) (math:linspace 5 0f0 1f0))
        (veq:f$_ `((-32.0f0 79.0f0) (-17.256249999999998f0 47.125f0)
                   (-5.324999999999999f0 27.5f0) (3.7937499999999993f0 20.125f0)
                   (10.1f0 25.0f0))))

    (is-arr (bzspl:pos* (bzspl:make pts-c :closed t) (math:linspace 5 0f0 1f0))
        #(-15.85 41.0 2.0468752 11.5625 3.6125004 29.0 -19.15 61.4375 -15.85 41.0))

    (is-arr (bzspl:pos* (bzspl:make pts-a) (math:linspace 10 0f0 1f0))
        #(-20.0 99.0 -11.851851 60.75309 -5.185185 33.12346 2.3841858e-7 16.11111
                3.7037039 9.716048 7.1604953 13.481483 17.77778 24.666668
                36.790127 42.81482 64.19753 67.92593 100.0 100.0))

    (is-arr (bzspl:pos* (bzspl:make pts-b) (math:linspace 10 0f0 1f0))
         #(-20.0 99.0 -5.185185 33.12346 3.7037039 9.716048 12.777779 20.222223
                 36.97531 43.728394 70.23457 72.91358 72.11111 69.55556 37.72839
                 29.481476 8.098764 1.0370363 0.0 4.0))

    (is-arr (bzspl:pos* (bzspl:make pts-a :closed t) (math:linspace 10 0f0 1f0))
        #(-10.0 50.0 -2.0987654 18.0 3.8271606 9.111111 12.777779 20.222223
                36.97531 43.728394 69.81482 75.77778 68.33333 95.33334 27.530859
                98.79012 -5.0617294 83.9753 -10.0 50.0))


    (is-arr (bzspl:pos* (bzspl:make pts-b :closed t) (math:linspace 10 0f0 1f0))
        #(-10.0 50.0 1.1111113 10.666667 12.777779 20.222223 55.0 60.0 72.11111
                69.55556 20.055546 10.166655 -1.5 -6.5 -4.611115 23.944466
                -14.444447 72.44444 -10.0 50.0))

    (rnd:set-rnd-state 1) ; adaptive pos uses rnd

    (is-arr (bzspl:adaptive-pos (bzspl:make (veq:f$_ '((0f0 0f0) (1f0 2f0) (-3f0 5f0)))))
        #(0.0 0.0 0.16016318 0.4552229 0.061584443 1.5997658 -0.730351 2.924048
          -1.6596264 3.8952951 -3.0 5.0))

    (is-arr (bzspl:adaptive-pos (bzspl:make (veq:f$_ '((0f0 0f0) (1f0 2f0) (-3f0 5f0))) :closed t))
        #(0.5 1.0 0.52988994 1.8024418 0.20320112 2.3758316 -0.8443723 3.38109
          -1.6050373 3.9095097 -2.1377919 3.9621549 -2.0189571 3.4709005 -1.0625432
          1.8142115 -0.3262586 0.9360465 0.15631074 0.71509457 0.5 1.0))
    (is (bzspl:len (bzspl:make pts-a)) 225.00311) ; len uses adaptive-pos inside
    (is (bzspl:len (bzspl:make pts-a :closed t)) 275.0494)))

(subtest "bzspl2"
  (veq:fvprogn
    (let ((bz (bzspl:make
                (veq:f$_ `((-20.0f0 99.0f0) (0.0f0 1.0f0) (10.0f0 20.0f0) (100.0f0 100.0f0)))
                :closed t)))
      (labels ((fx (a) (bzspl:pos bz a)))
        (is-arr (f12_@$fx (veq:f$lspace 10 0f0 1f0))
             #(-10.0 50.0 -2.0987654 18.0 3.8271606 9.111111 12.777779 20.222223
             36.97531 43.728394 69.81482 75.77778 68.33333 95.33334 27.530859
             98.79012 -5.0617294 83.9753 -10.0 50.0))))))

(subtest "pth"

    (let ((pth (pth:make (veq:f2$line 1f0 10f0 2f0 20f0) :closed nil)))
      (is (pth:@len pth) 10.049875)
      (is-arr (pth:pos pth 0.0f0) #(1f0 10f0))
      (is-arr (pth:pos pth 0.3f0) #(1.3f0 13f0))
      (is-arr (pth:pos pth 0.5f0) #(1.5f0 15f0))
      (is-arr (pth:pos pth 0.8f0) #(1.8f0 18f0))
      (is-arr (pth:pos pth 1.0f0) #(2f0 20f0))
      (is-arr (pth:lpos pth 0.0 1.0) (pth:@pts pth nil)))

    (let ((pth (pth:make (veq:f2$line 1f0 10f0 2f0 20f0) :closed t)))
      (is (pth:@len pth) 20.09975)
      (is-arr (pth:pos pth 0.0f0) #(1f0 10f0))
      (is-arr (pth:pos pth 0.3f0) #(1.6f0 16f0))
      (is-arr (pth:pos pth 0.5f0) #(2f0 20f0))
      (is-arr (pth:pos pth 0.8f0) #(1.4f0 14f0))
      (is-arr (pth:pos pth 1.0f0) #(1f0 10f0))
      (is-arr (pth:lpos pth 0.0 1.0) (pth:@pts pth t)))

    (let ((pth (pth:make (veq:f$~ (6) 1f0 2f0 5f0 6f0 10f0 11f0) :closed nil)))
      (is (pth:@len pth) 12.727922)
      (is-arr (pth:@pts pth) (veq:f$~ (6) 1f0 2f0 5f0 6f0 10f0 11f0))
      (is-arr (pth:@pts pth t) (veq:f$~ (8) 1f0 2f0 5f0 6f0 10f0 11f0 1f0 2f0))
      (is-arr (pth:pos pth 0.0f0) #(1f0 2f0))
      (is-arr (pth:pos pth 1.0f0) #(10f0 11f0))
      (is-arr (pth:pos pth 0.3f0) #(3.7000003 4.7000003))
      (is-arr (pth:pos pth 0.4f0) #(4.6000004 5.6000004))
      (is-arr (pth:lpos pth 0.3 0.4) #(3.7000003 4.7000003 4.6000004 5.6000004))
      (is-arr (pth:lpos pth 0.01 0.99) #(1.09 2.09 5.0 6.0 9.91 10.91))
      (is-arr (pth:lpos pth 0.0 1.0) (pth:@pts pth nil)))

    (let ((pth (pth:make (veq:f$~ (6) 1f0 2f0 5f0 6f0 10f0 11f0) :closed t)))
      (is (pth:@len pth) 25.455845)
      (is-arr (pth:@pts pth) (veq:f$~ (6) 1f0 2f0 5f0 6f0 10f0 11f0))
      (is-arr (pth:@pts pth t) (veq:f$~ (8) 1f0 2f0 5f0 6f0 10f0 11f0 1f0 2f0))
      (is-arr (pth:pos pth 0.0f0) #(1f0 2f0))
      (is-arr (pth:pos pth 1.0f0) #(1f0 2f0))
      (is-arr (pth:pos pth 0.3f0) #(6.4000006 7.4000006))
      (is-arr (pth:pos pth 0.4f0) #(8.200001 9.200001))
      (is-arr (pth:lpos pth 0.3 0.4) #(6.4000006 7.4000006 8.200001 9.200001))
      (is-arr (pth:lpos pth 0.01 0.99) #(1.1800001 2.18 5.0 6.0 10.0 11.0 1.1799994 2.1799994))
      (is-arr (pth:lpos pth 0.0 1.0) (pth:@pts pth t)))

    (let* ((pts (veq:f2$polygon 10 200f0))
           (pth (pth:make pts :closed t)))

      (is-arr (pth:lpos pth 0.83 0.78)
              #(91.80334 -168.41508 161.80345 -117.55699 200.0 0.0 161.8034
               117.55705 61.803394 190.2113 -61.803406 190.2113
               -161.8034 117.55704 -200.0 -1.7484555e-5 -161.80339
               -117.557076 -61.803417 -190.2113 37.081944 -190.2113))

      (is-arr (pth:lpos pth 0.83 0.51)
              #(91.80334 -168.41508 161.80345 -117.55699 200.0 0.0 161.8034 117.55705
                61.803394 190.2113 -61.803406 190.2113 -161.8034 117.55704 -200.0
                -1.7484555e-5 -196.18036 -11.755639))
      (is-arr (pth:lpos pth 0.83 0.0) #(91.80334 -168.41508 161.80345 -117.55699 200.0 0.0))
      (is-arr (pth:lpos pth 1.0 0.3) #(200.0 0.0 161.8034 117.55705 61.803394 190.2113
                                             -61.803402 190.2113))

      ; what behaviour do we actually want for 1,0? this might be just as well
      (is-arr (pth:lpos pth 1.0 0.0) #(200.0 0.0 200.0 0.0))
      (is-arr (pth:lpos pth 0.0 1.0)
              #(200.0 0.0 161.8034 117.55705 61.803394 190.2113 -61.803406 190.2113
                -161.8034 117.55704 -200.0 -1.7484555e-5 -161.80339
                -117.557076 -61.803417 -190.2113 61.803425 -190.2113 161.80345
                -117.55699 200.0 0.0))))

(unless (finalize) (error "error in bzspl tests"))

