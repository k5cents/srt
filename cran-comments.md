## Test environments

* local: ubuntu-20.04 (release)
* github actions: ubuntu-20.04 (release, devel)
  * <https://github.com/kiernann/srt/actions>
* github actions: macOS-latest (release)
* github actions: windows-latest (release) 
* r-hub: windows-x86_64-devel, ubuntu-gcc-release, fedora-clang-devel
  * <https://builder.r-hub.io/status/srt_1.0.1.tar.gz-9556da166e2f4bee839cc26d79849bc4>
  * <https://builder.r-hub.io/status/srt_1.0.1.tar.gz-57953a17314e4071a6960f6d9c25c462>
  * <https://builder.r-hub.io/status/srt_1.0.1.tar.gz-03fda78f4e6f415aacf485b9d0c7c141>

## R CMD check results

0 errors | 0 warnings | 0 note

## Resubmission

* Strings are converted to UTF-8 with `enc2utf8()` where needed and tests that
  reply on encoding are skipped on systems where said encoding is unavailable.

## Previous Submission

* `\value` tags added to documentation.
* SubRip was quoted and source website linked.
* Mentions of R removed from title and description.
