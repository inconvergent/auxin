
(in-package #:auxin-tests)

(plan 1)

(subtest "ortho"

  (let ((proj (ortho:make :xy (veq:f2$point 500f0 500f0)
                          :cam (veq:f3$point 731f0 1003f0 -1000f0)
                          :look (veq:f3$point 43f0 23f0 -10f0))))
    (is (veq:lst (ortho:project proj -33f0 100f0 -100f0))
        '(606.4451 557.0312 1481.3955))

    (ortho:update proj :cam (veq:f3$point  731f0 1003f0 -1001f0))

    (is (veq:lst (ortho:project proj -33f0 100f0 -100f0))
        '(606.4451 556.2605 1482.0327))

    (is (veq:lst (ortho:project* proj (veq:f3$line 1f0 3f0 4f0 5f0 3f0 2f0)))
        '(#(522.88336 514.24756 519.60956 514.32446) #(1594.4272 1591.3816))
        :test #'equalp)))


(unless (finalize) (error "error in ortho tests"))

