require 'rails_helper'

RSpec.describe WebsitesController, type: :controller do
  let(:valid_attributes) {
    { url: 'http://www.codebikeandmore.com' }
  }

  let(:invalid_attributes) {
    { url: '' }
  }

  describe 'GET #index' do
    it 'assigns all websites as @websites' do
      website = Website.create! valid_attributes
      get :index
      expect(assigns(:websites)).to eq([website])
    end

    it 'assigns a new website as @websites' do
      get :index
      expect(assigns(:website)).to be_a_new(Website)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested website as @website' do
      website = Website.create! valid_attributes
      get :show, params: { id: website.to_param }
      expect(assigns(:website)).to eq(website)
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

      it 'redirects to the created website' do
        post :create, params: { website: valid_attributes }
        expect(response).to redirect_to(Website.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved website as @website' do
        post :create, params: { website: invalid_attributes }
        expect(assigns(:website)).to be_a_new(Website)
      end

      it 're-renders the "new" template' do
        post :create, params: { website: invalid_attributes }
        expect(response).to render_template('index')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested website' do
      website = Website.create! valid_attributes
      expect {
        delete :destroy, params: {id: website.to_param }
      }.to change(Website, :count).by(-1)
    end

    it 'redirects to the websites list' do
      website = Website.create! valid_attributes
      delete :destroy, params: {id: website.to_param }
      expect(response).to redirect_to(websites_url)
    end
  end
end
