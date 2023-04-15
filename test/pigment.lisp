
(in-package #:auxin-tests)

(plan 1)

(subtest "pigment" ()

  (is (pigment:as-list (pigment:scale (pigment:rgb 1f0 0.3 0.2) 0.3))
      '(0.3 0.09 0.060000002 0.3))
  (is (pigment:as-list (pigment:scale (pigment:rgb 1f0 0.3 0.2 0.8) 0.3))
      '(0.24000001 0.072000004 0.048000004 0.24000001))
  (is (pigment:as-list (pigment:scale! (pigment:rgb 1f0 0.3 0.2 0.8) 0.3))
      '(0.24000001 0.072000004 0.048000004 0.24000001))

  (is (pigment:as-list (pigment:rgb 1f0 0.3 0.2)) '(1.0 0.3 0.2 1.0))
  (is (pigment:as-list (pigment:rgb 1f0 0.3 0.2 0.5)) '(0.5 0.15 0.1 0.5))
  (is (veq:lst (pigment:as-val (pigment:rgb 1f0 0.3 0.2))) '(1.0 0.3 0.2 1.0))

  (is (pigment:as-list* (pigment:rgb 1f0 0.3 0.2)) '(1.0 0.3 0.2 1.0))
  (is (pigment:as-list* (pigment:rgb 1f0 0.3 0.2 0.5)) '(1.0 0.3 0.2 0.5))
  (is (veq:lst (pigment:as-val* (pigment:rgb 1f0 0.3 0.2 0.5))) '(1.0 0.3 0.2 0.5))

  (is (pigment:as-hsv (pigment:rgb 1f0 0.3 0.2 1f0)) '(0.020833373 0.8 1.0 1.0))
  (is (pigment:as-hsv (pigment:rgb 1f0 0.3 0.2 0.5)) '(0.020833373 0.8 1.0 0.5))

  (is (pigment:as-hsv (pigment:hsv 0.8 0.2f0 0.6f0 1.0f0)) '(0.8000001 0.2 0.6 1.0))
  (is (pigment:as-hsv (pigment:hsv 0.8 0.2f0 0.6f0 0.95)) '(0.8000001 0.2 0.6 0.95))

  (is (pigment:as-list (pigment:cmyk 1.0 0.0f0 0.0 0f0)) '(0.0 1.0 1.0 1.0))
  (is (pigment:as-list (pigment:cmyk 1.0 0.0f0 0.0 0f0 0.5)) '(0.0 0.5 0.5 0.5)))

(unless (finalize) (error "error in pigment tests"))
