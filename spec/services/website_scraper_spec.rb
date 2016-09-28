require 'rails_helper'

# NOTE: here I'd add VCR for better predicting specs and not perform Network
# requests all the time. In the end, this is a mixture of unit and end to end specs.
RSpec.describe WebsiteScraper do
  context 'with a valid url' do
    let(:website) { Website.new(url: 'http://codebikeandmore.com') }

    it 'fills in the title attribute of a webiste' do
      complete_website = WebsiteScraper.new(website).go_get_it
      expect(complete_website.title).to eq('Code, Bike & More')
    end

    it 'fills in the links of a webiste' do
      complete_website = WebsiteScraper.new(website).go_get_it
      expect(complete_website.links).to_not be_empty
    end

    it 'fills in the headers of a webiste' do
      complete_website = WebsiteScraper.new(website).go_get_it
      expect(complete_website.headers).to_not be_empty
    end
  end

  context 'with a invalid url' do
    let(:website) { Website.new(url: 'http invalid url') }

    it 'return the website unchanged' do
      expect {
        WebsiteScraper.new(website).go_get_it
      }.to_not change { website.title }
    end
  end
end
