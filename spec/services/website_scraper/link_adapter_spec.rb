require 'rails_helper'

RSpec.describe WebsiteScraper::LinkAdapter do
  let(:adapter) { WebsiteScraper::LinkAdapter.new(page_link) }

  context 'when getting a links text' do
    context 'and the text is fine' do
      let(:page_link) { double('link', text: 'I have some text') }

      it 'returns its text' do
        expect(adapter.text).to eq('I have some text')
      end
    end

    context 'and the text is blank-ish ' do
      let(:page_link) { double('link', text: "    \n    ", resolved_uri: 'resolved_uri') }

      it 'returns its resolved_uri instead' do
        expect(adapter.text).to eq('resolved_uri')
      end
    end
  end

  context 'when getting a links href' do
    context 'and the scheme is known' do
      let(:page_link) { double('link', resolved_uri: 'http://codebikeandmore.com') }

      it 'returns its absolute path' do
        expect(adapter.href).to eq('http://codebikeandmore.com')
      end
    end

    context 'and the scheme is not known' do
      let(:page_link) { double('link', uri: 'http://codebikeandmore.com') }
      before { allow(page_link).to receive(:resolved_uri).and_raise(Mechanize::UnsupportedSchemeError.new(nil, nil)) }

      it 'returns its uri' do
        expect(adapter.href).to eq('http://codebikeandmore.com')
      end
    end
  end
end
