class WebsiteScrapper
  def initialize(website, driver = Mechanize.new)
    @website = website
    @driver  = driver
  end

  def go_get_it
    page = @driver.get(@website.url)
    set_title(page)
    @website
  end

  private

  def set_title(page)
    @website.title = page.title
  end
end
