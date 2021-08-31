#' Parse components of a subtitle file
#'
#' @param x A character vector with the lines of an `.srt` file.
#' @param collapse The character with which to separate subtitle lines.
#' @examples
#' # return individual components of each subtitle
#' x <- readLines(srt_example())
#' head(srt_seconds(x)[[1]])
#' head(srt_index(x))
#' head(srt_text(x))
#' @return The parsed individual components of a subtitle: integer indexes,
#'   numeric times, and collapsed string subtitles.
#' @export
srt_seconds <- function(x) {
  nl <- newline(x)
  times <- strsplit(x[c(2, nl + 2)], "\\s-->\\s")
  times <- lapply(times, as_seconds)
  seconds <- do.call(Map, c(f = c, times))
  names(seconds) <- c("start", "end")
  return(seconds)
}

#' @rdname srt_seconds
#' @export
srt_index <- function(x) {
  nl <- newline(x)
  x <- x[c(1, nl + 1)]
  as.integer(x[!is.na(x)])
}

#' @rdname srt_seconds
#' @export
srt_text <- function(x, collapse = "\n") {
  nl <- newline(x)
  a <- c(2, nl + 2) + 1
  b <- c(which(x == "") - 1, length(x))
  if (x[length(x)] == "") {
    b[length(b)] <- b[length(b)] - 1
  }
  y <- rep(NA_character_, length(a))
  for (i in seq_along(a)) {
    y[i] <- paste(x[seq(a[i], b[i])], collapse = collapse)
  }
  return(y)
}

newline <- function(x, rm.last = TRUE) {
  nl <- which(x == "")
  if (rm.last & x[length(x)] == "") {
    nl <- nl[-length(nl)]
  }
  return(nl)
}

as_seconds <- function(y) {
  y <- gsub(",", ".", y)
  y <- strsplit(y, ":")
  y <- lapply(y, FUN = as.numeric)
  vapply(y, sum_time, double(1))
}

sum_time <- function(l) {
  l[2] <- l[2] + (l[1] * 60)
  l[3] + (l[2] * 60)
}
