## Test environments

* local: ubuntu-20.04 (release), R 4.0.3
* github actions: <https://github.com/kiernann/srt/actions>
  * windows-latest (release) 
  * macOS-latest (release)
  * ubuntu-20.04 (release)
  * ubuntu-20.04 (devel)
* r-hub: windows-x86_64-devel, ubuntu-gcc-release, fedora-clang-devel
  * <https://builder.r-hub.io/status/srt_1.0.1.tar.gz-c9a2cd65fb5044d9a6bbe72c4885d80b>
  * <https://builder.r-hub.io/status/srt_1.0.1.tar.gz-b4500f6a18de4f3baf233bc7294b8179>
  * <https://builder.r-hub.io/status/srt_1.0.1.tar.gz-06afd9f794b94f129b7485cf77ac835c>

## R CMD check results

0 errors | 0 warnings | 0 note

## Resubmission

* Strings are converted to UTF-8 with `enc2utf8()` where needed and tests that
  reply on encoding are skipped on systems where said encoding is unavailable.
* Example files are replaced with one from the public domain.

## Previous Submission

* `\value` tags added to documentation.
* SubRip was quoted and source website linked.
* Mentions of R removed from title and description.
