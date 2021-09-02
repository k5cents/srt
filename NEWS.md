# srt (development version)

# srt 1.0.3

* Remove consecutive newlines in character vector before parsing subtitles (#3).

# srt 1.0.2

* Example files are replaced with one from the public domain.
* Use UTF-8 string encoding where needed and skip tests when unavailable.

# srt 1.0.0

* Added a `NEWS.md` file to track changes to the package.
* Created simple `read_srt()` function to combine parsed `.srt` components:
    * `srt_index()` for the subtitle index.
    * `srt_seconds()` for the start and end time (in seconds).
    * `srt_text()` for the collapsed subtitle text itself.
* Created simple `write_srt()` function to un-parse a data frame.
* Created `srt_shift()` to apply add/subtract seconds to time columns.
* Test if data frames match the subtitle format expected to shift, write, etc.
