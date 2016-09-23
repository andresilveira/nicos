require 'rails_helper'

RSpec.describe Website, type: :model do
  describe 'validations' do
    it 'require url to be present' do
      website = Website.new(url: nil)
      website.save
      expect(website.errors).to include(:url)
    end
  end
end
