require 'rails_helper'

# TODO: here I'd add VCR for better predicting specs and not perform Network
# requests all the time
RSpec.describe WebsiteScrapper do
  context 'with a valid url' do
    let(:website) { Website.new(url: 'http://codebikeandmore.com') }

    it 'fills in the title attribute of a webiste' do
      complete_website = WebsiteScrapper.new(website).go_get_it
      expect(complete_website.title).to eq('Code, Bike & More')
    end
  end

  context 'with a invalid url' do
    let(:website) { Website.new(url: 'http invalid url') }

    it 'return the website unchanged' do
      expect {
        WebsiteScrapper.new(website).go_get_it
      }.to_not change{ website.title  }
    end
  end
end
