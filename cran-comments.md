## Test environments

* local: ubuntu-20.04 (release), R 4.0.3
* github actions: <https://github.com/kiernann/srt/actions>
  * windows-latest (release) 
  * macOS-latest (release)
  * ubuntu-20.04 (release)
  * ubuntu-20.04 (devel)
* r-hub: windows-x86_64-devel, ubuntu-gcc-release, fedora-clang-devel
  * <https://builder.r-hub.io/status/srt_1.0.2.tar.gz-5143ae60ea8749be930c9e0ba31fe93c>
  * <https://builder.r-hub.io/status/srt_1.0.2.tar.gz-e1e90976b8454ca9bed819a96cdb6f78>
  * <https://builder.r-hub.io/status/srt_1.0.2.tar.gz-46a57e7bd59549eaa0a38de003106059>

## R CMD check results

0 errors | 0 warnings | 0 note

## Resubmission

* Strings are converted to UTF-8 with `enc2utf8()` where needed and tests that
  reply on encoding are skipped on systems where said encoding is unavailable.
* Example files are replaced with one from the public domain.
* Redirected URLs are now replaced in documentation.

## Previous Submission

* `\value` tags added to documentation.
* SubRip was quoted and source website linked.
* Mentions of R removed from title and description.
