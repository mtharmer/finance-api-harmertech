# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MortgagesController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/mortgage').to route_to('mortgages#show')
    end

    it 'routes to #create' do
      expect(post: '/mortgage').to route_to('mortgages#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/mortgage').to route_to('mortgages#update')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/mortgage').to route_to('mortgages#update')
    end

    it 'routes to #destroy' do
      expect(delete: '/mortgage').to route_to('mortgages#destroy')
    end
  end
end
