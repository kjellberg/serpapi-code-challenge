# frozen_string_literal: true

require_relative "lib/google_parser/version"

Gem::Specification.new do |spec|
  spec.name = "google_parser"
  spec.version = GoogleParser::VERSION
  spec.authors = [ "Rasmus Kjellberg" ]
  spec.email = [ "2277443+kjellberg@users.noreply.github.com" ]

  spec.summary = "Parse data from Google organic search results."
  spec.description = "Write a longer description or delete this line."

  spec.homepage = "https://github.com/serpapi/code-challenge"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/serpapi/code-challenge"
  spec.metadata["changelog_uri"] = "https://github.com/serpapi/code-challenge"

  spec.files = Dir["lib/**/*", "MIT-LICENSE", "README.md"]
  spec.require_paths = [ "lib" ]

  spec.add_dependency "nokogiri", "~> 1.16.6"
  spec.add_dependency "selenium-webdriver", "~> 4.12"
end
