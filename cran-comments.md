## Test environments

* local: ubuntu-20.04 (release), R 4.0.3
* github actions: <https://github.com/kiernann/srt/actions>
  * windows-latest (release) 
  * macOS-latest (release)
  * ubuntu-20.04 (release)
  * ubuntu-20.04 (devel)
* r-hub: windows-x86_64-devel, ubuntu-gcc-release, fedora-clang-devel
  * <https://builder.r-hub.io/status/srt_1.0.3.tar.gz-23cbb635199c4bb7977c5848534009ca>
  * <https://builder.r-hub.io/status/srt_1.0.3.tar.gz-8f417aa6e4e64dbba9e402b2f938d421>
  * <https://builder.r-hub.io/status/srt_1.0.3.tar.gz-f271f87d665845f5bbc8a8c46da2beb2>

## R CMD check results

0 errors | 0 warnings | 0 note

## Previous Submission(s)

* Strings are converted to UTF-8 with `enc2utf8()` where needed and tests that
  reply on encoding are skipped on systems where said encoding is unavailable.
* Example files are replaced with one from the public domain.
* Redirected URLs are now replaced in documentation.
* `\value` tags added to documentation.
* SubRip was quoted and source website linked.
* Mentions of R removed from title and description.
