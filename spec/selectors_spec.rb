require "spec_helper"

RSpec.describe GoogleParser::Selectors do
  let(:html) { File.read("files/van-gogh-paintings.html") }
  let(:doc) { Nokogiri::HTML(html) }

  describe ".find" do
    it "returns the correct selectors if matching" do
      selectors = described_class.new(doc).find(:artworks)
      expect(selectors[:container]).to eq(".MiPcId.klitem-tr.mlo-c")
    end
  end
end
