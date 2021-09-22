# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'has status 200' do
    post users_path, params: { user: { role: 'general' } }
    expect(response).to have_http_status(:ok)
  end

  it 'contains created user' do
    post users_path, params: { user: { role: 'general' } }
    expect(response.parsed_body.deep_symbolize_keys[:user]).to include(
      id: kind_of(Integer),
      role: 'general'
    )
  end

  it 'creates user' do
    expect do
      post users_path, params: { user: { role: 'general' } }
    end.to change(User, :count).by(1)
  end
end
