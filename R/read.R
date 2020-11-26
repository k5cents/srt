#' Read a subtitle file as data frame
#'
#' Convert the SubRip file format to a tabular data frame of times and text.
#'
#' The SubRip format is a newline-separated, non-tabular text file with groups
#' of subtitle text separated by a newline character and preceded by an index
#' and a timestamp string containing the length of the spoken subtitle text.
#' These components (index, time, text) can be parsed individually and combined
#' into a data frame of subtitle groups.
#'
#' @param path A path or connection to an `.srt` file.
#' @param collapse The character with which to separate subtitle lines.
#' @examples
#' # read linear text to tabular data
#' read_srt(srt_example("toy-story.en.srt"), " ")
#' @return A data frame of subtitles.
#' @export
read_srt <- function(path, collapse = "\n") {
  x <- readLines(con = path)
  t <- srt_seconds(x)
  y <- data.frame(
    stringsAsFactors = FALSE,
    n = srt_index(x),
    start = t$start,
    end = t$end,
    subtitle = srt_text(x, collapse = collapse)
  )
  as_tibble(y)
}
