class WebsiteScraper
  class LinkAdapter
    def initialize(page_link)
      @page_link = page_link
    end

    def text
      relevant_link_text
    end

    def href
      @page_link.resolved_uri.to_s
    rescue Mechanize::UnsupportedSchemeError
      @page_link.uri.to_s
    end

    private

    def relevant_link_text
      if @page_link.text.strip.blank?
        href
      else
        @page_link.text
      end
    end
  end
end
