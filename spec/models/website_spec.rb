require 'rails_helper'

RSpec.describe Website, type: :model do
  describe 'validations' do
    let(:website) { Website.new }

    it 'require url to be present' do
      website.url = nil
      website.save
      expect(website.errors).to include(:url)
    end

    it 'requires the url to be valid' do
      website.url = 'some weird url'
      website.save
      expect(website.errors).to include(:url)
    end
  end
end
