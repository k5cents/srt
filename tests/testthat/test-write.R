test_that("srt text files written from data frame", {
  x <- read_srt(srt_example(1))
  p <- write_srt(x, tempfile(fileext = ".srt"))
  expect_true(file.exists(p))
  expect_error(read.csv(p))
  expect_error(readLines(p), NA)
})
