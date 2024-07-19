# frozen_string_literal: true

module GoogleParser
  class InvalidJsModelError < StandardError; end

  class Selectors
    MAP = {
      artworks: [
        {
          container: ".MiPcId.klitem-tr.mlo-c",
          name: lambda { |element| element.css("div.kltat")&.text&.strip },
          link: lambda { |element| element.css("a.klitem").attr("href")&.value },
          image: lambda { |element| element.css("img.rISBZc.M4dUYb")&.attr("src")&.value },
          year: lambda { |element| element.css(".ellip.klmeta")&.text&.strip }
        }
      ]
    }

    def initialize(doc)
      @doc = doc
    end

    def find(element)
      MAP[element].each do |selector|
        return selector if @doc.css(selector[:container]).any?
      end
    end
  end
end
