require 'rails_helper'

RSpec.describe WebsiteScraper::HeaderAdapter do
  let(:adapter) { WebsiteScraper::HeaderAdapter.new(page_header) }

  context 'when getting a headers text' do
    let(:page_header) { double('link', text: 'I have some text') }

    it 'returns its text' do
      expect(adapter.text).to eq('I have some text')
    end
  end

  context 'when getting a headers tag' do
    let(:page_header) { double('link', name: 'h1') }

    it 'returns its [tag] name' do
      expect(adapter.tag).to eq('h1')
    end
  end

  describe '#to_h' do
    let(:page_header) { double('link', name: 'h1', text: 'text') }

    it 'returns a hash containing its tag and text' do
      expect(adapter.to_h).to eq(tag: 'h1', text: 'text')
    end
  end
end
