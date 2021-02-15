as_tibble <- function(x) {
  if (is_installed("tibble")) {
    tibble::as_tibble(x)
  } else {
    x
  }
}

is_installed <- function(pkg) {
  isTRUE(requireNamespace(pkg, quietly = TRUE))
}

skip_non_utf8 <- function() {
  testthat::skip_if(
    condition = all(
      .Platform$OS.type == "unix",
      Encoding(enc2native("\U00FC")) != "UTF-8"
    ),
    message = "Skipping non-ASCII line tests on UTF-8 Unix system"
  )
}
