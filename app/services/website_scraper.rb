class WebsiteScraper
  attr_reader :website

  def initialize(website, driver = Mechanize.new, url_validator = Validators::Url)
    @website = website
    @driver  = driver
    @url_validator = url_validator
  end

  def go_get_it
    if @url_validator.valid?(website.url)
      page = @driver.get(website.url)
      fill_in_title(page)
      fill_in_links(page)
    end
    website
  end

  private

  def link_adapter_class
    WebsiteScraper::LinkAdapter
  end

  def fill_in_title(page)
    website.title = page.title
  end

  def fill_in_links(page)
    page.links.each do |page_link|
      link = link_adapter_class.new(page_link)
      website.links.build(
        text: link.text,
        href: link.href
      )
    end
  end
end
