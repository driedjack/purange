# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::SessionsController, type: :request do
  describe 'get login admin page' do
    let(:admin) { create(:admin) }

    it 'success' do
      get '/admin/login'
      expect(response).to have_http_status(:success)
      post '/admin/login', params: { name: admin.name, password: 'admin' }
      expect(response).to redirect_to('/admin')
      follow_redirect!
      expect(response.body).to include('Dashboard')

      get '/admin/login'
      expect(response).to redirect_to('/admin')
    end
  end
end
