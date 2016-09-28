require 'rails_helper'

RSpec.describe 'api/v1/websites/index' do
  let(:websites) do
    [
      Website.create!(
        url: 'http://codebikeandmore.com',
        title: 'Code, Bike & More',
        links: [ Link.new(href: 'http://fakelink.fake', text: 'I am fake') ]
      ),
      Website.create!(
        url: 'http://google.com',
        title: 'Google',
        links: [ Link.new(href: 'http://anotherfakelink.fake', text: 'I am another fake') ]
      )
    ]
  end

  let(:parsed_response) { JSON.parse(render).with_indifferent_access }

  before { assign(:websites, websites) }

  it 'displays all the websites' do
    expect(parsed_response[:websites].count).to eq(2)
  end

  describe 'the websites' do
    it 'show their url' do
      expect(parsed_response[:websites].first[:url]).to eq('http://codebikeandmore.com')
      expect(parsed_response[:websites].last[:url]).to eq('http://google.com')
    end

    it 'show their title' do
      expect(parsed_response[:websites].first[:title]).to eq('Code, Bike & More')
      expect(parsed_response[:websites].last[:title]).to eq('Google')
    end

    describe 'show their links' do
      it 'with their href' do
        expect(parsed_response[:websites].first[:links].first[:href]).to eq('http://fakelink.fake')
        expect(parsed_response[:websites].last[:links].first[:href]).to eq('http://anotherfakelink.fake')
      end

      it 'with their text' do
        expect(parsed_response[:websites].first[:links].first[:text]).to eq('I am fake')
        expect(parsed_response[:websites].last[:links].first[:text]).to eq('I am another fake')
      end
    end
  end
end
