# Headless Preference Setting Bug

When Chromedriver is running in the new headless mode (add --headless argument AND --disable-gpu) then it ignores any preferences given to it. Specifically the preference not to download images.

The way I've tested it is creating a dummy image server (`image_server.rb`) which you run first. It simply responds to HTTP requests and prints a message to the command line. So watch the output of that - if there is any output then Selenium is NOT working as expected. 

Then you run `selenium_chrome_prefs.rb` which navigates to the page `test.html`. That page has an image tag downloading an image from the dummy image server. Running this script should not cause the image to be downloaded if the preference is respected. Add / remove the `headless` flag to see the issue - when headless the pref is ignored and the image is downloaded.

## Test procedure

1. `ruby image_server.rb`
2. `ruby selenium_chrome_prefs.rb`
3. Check the output of `image_server.rb` - there shouldn't be any!
4. Add / remove the `headless` argument in `selenium_chrome_prefs.rb` and see the effect it has.
