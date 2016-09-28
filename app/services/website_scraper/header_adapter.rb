class WebsiteScraper
  class HeaderAdapter
    def initialize(page_header)
      @page_header = page_header
    end

    def text
      @page_header.text.strip
    end

    def tag
      @page_header.name
    end

    def to_h
      { tag: tag, text: text }
    end
  end
end
