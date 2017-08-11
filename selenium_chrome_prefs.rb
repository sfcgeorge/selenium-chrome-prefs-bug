# This simply navigates to `test.html`. First start image_server.rb
# If the preference is being honoured, the image in `test.html` won't
# be downloaded (watch the output of image_server.rb).
# With the headless argument the preference is ignored.
# But if you remove headless, it works (no image downloaded)

require "selenium-webdriver"

Selenium::WebDriver.logger.level = :debug

options = Selenium::WebDriver::Chrome::Options.new(
  # The bug is still present in Canary
  # binary: "/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary",
  args: %w[headless disable-gpu],
  prefs: {
    "profile.managed_default_content_settings.images" => 2
  }
)

driver = Selenium::WebDriver.for :chrome, options: options
url = "file://#{__dir__}/test.html"
puts url
driver.navigate.to url
