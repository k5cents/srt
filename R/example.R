#' Get path to srt example
#'
#' srt comes bundled with a number of sample files in its `inst/extdata`
#' directory. This function make them easy to access.
#'
#' _It's a Wonderful Life_ (1946) entered the public domain in 1974.
#'
#' @examples
#' srt_example()
#' @return The path or name to a example `.srt` file.
#' @export
srt_example <- function() {
  system.file(
    "extdata", "Its-a-Wonderful-Life.srt",
    package = "srt",
    mustWork = TRUE
  )
}
