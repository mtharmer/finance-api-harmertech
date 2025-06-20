# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DebtsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/debts').to route_to('debts#index')
    end

    it 'routes to #show' do
      expect(get: '/debts/1').to route_to('debts#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/debts').to route_to('debts#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/debts/1').to route_to('debts#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/debts/1').to route_to('debts#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/debts/1').to route_to('debts#destroy', id: '1')
    end
  end
end
