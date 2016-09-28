require 'rails_helper'

RSpec.describe Header, type: :model do
  describe 'validations' do
    it 'ensure a header has tag' do
      header = Header.new(tag: nil)
      header.save
      expect(header.errors).to include(:tag)
    end

    it 'ensures that the tag is known' do
      header = Header.new(tag: 'some weird tag')
      header.save
      expect(header.errors).to include(:tag)
    end
  end
end
