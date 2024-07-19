require "spec_helper"

RSpec.describe GoogleParser::Parser do
  let(:file_path) { File.expand_path("files/van-gogh-paintings.html") }
  let(:expected_results) { JSON.load(File.read("files/expected-array.json")) }
  let(:parser) { described_class.new(file_path) }

  describe "#artworks" do
    it "extracts artwork results" do
      expect(parser.artworks[0]).to match(expected_results[0])
    end

    it "extracts at least 10 results" do
      expect(parser.artworks.size).to be >= 10
    end
  end
end
