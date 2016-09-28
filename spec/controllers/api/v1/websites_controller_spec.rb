require 'rails_helper'

RSpec.describe Api::V1::WebsitesController, type: :controller do
  let(:valid_attributes) {
    { url: 'http://www.codebikeandmore.com' }
  }

  let(:invalid_attributes) {
    { url: '' }
  }

  before { request.accept = 'application/json' }

  describe 'GET #index' do
    it 'assigns all websites as @websites' do
      website = Website.create! valid_attributes
      get :index
      expect(assigns(@websites)[:websites]).to eq([website])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Website' do
        expect {
          post :create, params: { website: valid_attributes }
        }.to change(Website, :count).by(1)
      end

      it 'assigns a newly created website as @website' do
        post :create, params: { website: valid_attributes }
        expect(assigns(:website)).to be_a(Website)
        expect(assigns(:website)).to be_persisted
      end

      it 'should respond with created status' do
        post :create, params: { website: valid_attributes }
        expect(response).to render_template('create')
      end

      context 'will pass the website to the WebsiteScraper' do
        let(:scraper) { double('scraper', go_get_it: Website.new) }
        before { allow(WebsiteScraper).to receive(:new).and_return(scraper) }

        it 'scraps the new Website' do
          expect(scraper).to receive(:go_get_it)
          post :create, params: { website: valid_attributes }
        end
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved website as @website' do
        post :create, params: { website: invalid_attributes }
        expect(assigns(:website)).to be_a_new(Website)
      end

      it 're-renders the "new" template' do
        post :create, params: { website: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end
end
