require 'rails_helper'

# TODO: here I'd add VCR for better predicting specs and not perform Network
# requests all the time
RSpec.describe WebsiteScrapper do
  let(:website) { Website.new(url: 'http://codebikeandmore.com') }

  it 'fills in the title attribute of a webiste' do
    complete_website = WebsiteScrapper.new(website).go_get_it
    expect(complete_website.title).to eq('Code, Bike & More')
  end
end
