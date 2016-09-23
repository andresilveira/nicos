require 'rails_helper'

RSpec.describe WebsitesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/websites').to route_to('websites#index')
    end

    it 'routes to #show' do
      expect(get: '/websites/1').to route_to('websites#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/websites').to route_to('websites#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/websites/1').to route_to('websites#destroy', id: '1')
    end
  end
end
