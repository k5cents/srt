# srt 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
* Created simple `read_srt()` function to combine parsed `.srt` components:
    * `srt_index()` for the subtitle index.
    * `srt_seconds()` for the start and end time (in seconds).
    * `srt_text()` for the collapsed subtitle text itself.
