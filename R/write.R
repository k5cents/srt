#' Write subtitle data frame as SubRip text file
#'
#' @details
#' The SubRip text files format subtitles with four components separated by
#' a blank line:
#' 1. A numeric counter identifying each sequential subtitle
#' 2. The time that the subtitle should appear on the screen, followed by `-->`
#' and the time it should disappear
#' 3. Subtitle text itself on one or more lines
#' 4. A blank line containing no text, indicating the end of this subtitle
#' @param x A subtitle data frame from [read_srt()].
#' @param path File or connection to write to.
#' @param wrap If `TRUE` (default), subtitle lines will be wrapped.
#' @param width If `wrap` is `TRUE`, the width of each wrapped subtitle.
#' @export
write_srt <- function(x, path = NULL, wrap = TRUE, width = 40) {
  stopifnot(is_srt(x))
  x[2:3] <- lapply(x[2:3], as_timestamp)
  if (wrap) {
    x[[4]] <- paste(strwrap(x[[4]], width = width), collapse = "\n")
  }
  subs <- paste(
    x[[1]], # index
    paste(x[[2]], x[[3]], sep = " --> "), #timestamp
    x[[4]], # subtitle text
    "", # newline break
    sep = "\n"
  )
  writeLines(subs, con = path, sep = "\n")
  invisible(path)
}

as_timestamp <- function(y){
  if (is.character(y)) {
    return(y)
  }
  sec <- sprintf("%.3f", round(y %% 60, 3))
  sec <- sub("\\.", ",", sec)
  sec <- sub("^(\\d{1})(?=,)", "0\\1", sec, perl = TRUE)
  paste(
    sprintf("%02d", y %/% (60 * 60) %% 24), # hours
    sprintf("%02d", y %/% 60 %% 60), # minutes
    sec, sep = ":"
  )
}
