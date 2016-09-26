require 'rails_helper'

RSpec.describe Validators::Url do
  describe '#valid?' do
    it 'return false for a nil url' do
      expect(Validators::Url.valid?(nil)).to be_falsey
    end

    it 'return false for an empty url' do
      expect(Validators::Url.valid?('')).to be_falsey
    end

    it 'return false for a invalid url' do
      expect(Validators::Url.valid?('http i am not an url')).to be_falsey
    end

    it 'return true for a valid url' do
      expect(Validators::Url.valid?('http://codebikeandmore.com')).to be_truthy
    end
  end
end
