# draft.kings 0.5.5
* Fixed issue in `dk_prepare_schematic()` introduced when using player position instead of roster slot id
* Updated vignettes and README
* Removed jsonlite from imports
* Added GitHub Actions workflows for documentation and testing

# draft.kings 0.5.4
* Added pkgdown site and udpated README
* Removed `dk_get()` and `dk_multi_get()`
* Renamed functions like `dk_request_*()` to `dk_req_*()`
* Renamed functions like `dk_response_*()` to `dk_resp_*()`
* Replaced `cookies_file` argument with `iv` and `jwe` arguments to functions that require DraftKings session cookies
