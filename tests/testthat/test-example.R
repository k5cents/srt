test_that("all example basenames listed", {
  skip_non_utf8()
  p <- srt_example()
  expect_length(p, 2)
  expect_type(p, "character")
  expect_equal(unique(dirname(p)), ".")
})

test_that("example paths given by index", {
  skip_non_utf8()
  p <- srt_example(1)
  expect_length(p, 1)
  expect_type(p, "character")
  expect_false(dirname(p) == ".")
})

test_that("example paths given by name", {
  skip_non_utf8()
  p <- srt_example("community-pilot.en.srt")
  expect_length(p, 1)
  expect_type(p, "character")
  expect_false(dirname(p) == ".")
})
