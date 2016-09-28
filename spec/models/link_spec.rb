require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    it 'ensure a link has href' do
      link = Link.new(href: nil)
      link.save
      expect(link.errors).to include(:href)
    end
    
    it 'ensure a link has text' do
      link = Link.new(text: nil)
      link.save
      expect(link.errors).to include(:text)
    end
  end
end
