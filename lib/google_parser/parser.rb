module GoogleParser
  class Parser
    attr_reader :artworks, :file_path

    def initialize(file_path)
      @file_path = file_path
      @doc = Nokogiri::HTML(evaluate_javascript(file_path))
    end

    def artworks
      @artworks ||= begin
        selectors = GoogleParser::Selectors.new(@doc).find(:artworks)
        results = @doc.css(selectors.dig(:container))
        results.map.with_index(1) do |result, index|
          {
            # Get the position of the result, commented out to
            # match the expected results in the code challenge.
            # "position" => index
            "name" => selectors[:name]&.call(result),
            "link" => prepend_google_url(selectors[:link]&.call(result)),
            "image" => selectors[:image].call(result)&.gsub("=", "x3d"),
            "extensions" => [
              selectors[:year]&.call(result)
            ]
          }
        end
      end
    end

    private

    def evaluate_javascript(file_path)
      # Set up the Selenium WebDriver with headless Chrome
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument("--headless")
      options.add_argument("--disable-gpu")
      options.add_argument("--no-sandbox")
      options.add_argument("--disable-dev-shm-usage")

      # Initialize the WebDriver
      driver = Selenium::WebDriver.for :chrome, options: options

      # Load the local HTML file
      driver.navigate.to "file://#{@file_path}"

      # Wait for the JavaScript to execute
      sleep 1

      # Get the HTML after JavaScript has executed
      html = driver.page_source

      # Close the WebDriver
      driver.quit

      # Return the html
      html
    end

    # Prepend relative path to full Google URL
    # @param path [String] relative path
    # @return [String] absolute Google URL
    def prepend_google_url(path)
      "https://www.google.com#{path}"
    end
  end
end
