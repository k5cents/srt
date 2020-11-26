#' Get path to srt example
#'
#' srt comes bundled with a number of sample files in its `inst/extdata`
#' directory. This function make them easy to access.
#'
#' @param file Name or number of file. If `NULL`, file names are be listed.
#' @examples
#' srt_example()
#' srt_example(1)
#' srt_example("toy-story.en.srt")
#' @return The path or name to example `.srt` files.
#' @export
srt_example <- function(file = NULL) {
  exs <- dir(system.file("extdata", package = "srt"))
  if (is.null(file)) {
    return(exs)
  } else if (is.numeric(file)) {
    file <- exs[file]
  }
  system.file("extdata", file, package = "srt", mustWork = TRUE)
}
