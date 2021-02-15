test_that("all example basenames listed", {
  skip_non_utf8()
  p <- srt_example()
  expect_length(p, 1)
  expect_type(p, "character")
})
