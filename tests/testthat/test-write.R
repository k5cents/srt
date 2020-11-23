test_that("srt text files written from data frame", {
  x <- read_srt(srt_example(1))
  p <- write_srt(x, tempfile(fileext = ".srt"))
  expect_true(file.exists(p))
  expect_error(read.csv(p))
  expect_error(readLines(p), NA)
})

test_that("non-srt files fail to write", {
  expect_error(write_srt(1:3))
  expect_error(write_srt(letters))
  expect_error(write_srt(iris))
  x <- read_srt(srt_example(1))
  x[[2]] <- as.character(x[[2]])
  expect_error(write_srt(x))
  x <- read_srt(srt_example(1))
  x[[3]] <- as.character(x[[3]])
  expect_error(write_srt(x))
})

test_that("written lines match read lines exactly", {
  x <- read_srt(srt_example(2), collapse = "\n")
  p <- write_srt(x, tempfile(fileext = ".srt"), wrap = FALSE)
  expect_true(file.exists(p))
  a <- readLines(srt_example(2))
  b <- readLines(p)
  expect_equal(a, b)
})
