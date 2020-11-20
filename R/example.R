#' Get path to srt example
#'
#' srt comes bundled with a number of sample files in its `inst/extdata`
#' directory. This function make them easy to access.
#'
#' @param file Name of file. If `NULL`, the example files will be listed.
#' @export
#' @examples
#' srt_example()
#' srt_example("toy-story.en.srt")
srt_example <- function(file = NULL) {
  exs <- dir(system.file("extdata", package = "srt"))
  if (is.null(file)) {
    return(exs)
  } else if (is.numeric(file)) {
    file <- exs[file]
  }
  system.file("extdata", file, package = "srt", mustWork = TRUE)
}
