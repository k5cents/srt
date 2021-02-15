#' Uniformly shift subtitle times
#'
#' @details
#' Here is a workflow of how a linear srt file is shifted in R.
#' ```
#' read_srt(file) %>%
#'   srt_shift(2.1) %>%
#'   write_srt(file)
#' ```
#' @param x A subtitle data frame from [read_srt()].
#' @param seconds The number of seconds to shift the start and end time.
#' @examples
#' # shift all start and stop by a some time
#' x <- read_srt(srt_example(), collapse = " ")
#' srt_shift(x, 1.234)
#' @return The numeric start times uniformly shifted by some amount.
#' @export
srt_shift <- function(x, seconds) {
  stopifnot(is_srt(x))
  x[2:3] <- x[2:3] + seconds
  return(x)
}

is_srt <- function(x) {
  if (!is.data.frame(x)) {
    stop("x is not a data frame")
  }
  if (ncol(x) != 4) {
    stop("x does not have 4 columns")
  }
  if (!is.numeric(x[[2]])) {
    stop("column 2 is not numeric")
  }
  if (!is.numeric(x[[3]])) {
    stop("column 3 is not numeric")
  }
  return(TRUE)
}
