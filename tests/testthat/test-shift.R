test_that("subtitle times can be shifted", {
  skip_non_utf8()
  x <- read_srt(srt_example(2))
  t1 <- x$start[1]
  x <- srt_shift(x, 99)
  t2 <- x$start[1]
  expect_gt(t2, t1)
})
