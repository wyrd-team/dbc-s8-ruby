# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/users', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { role: :admin }
  end

  let(:valid_header) do
    { operator_id: operator&.id }
  end

  let(:operator) { nil }

  before do
    operator
  end

  describe 'GET /index' do
    context 'when operator has admin role' do
      let(:operator) { create(:user, role: :admin) }

      it 'contains multiple users' do
        user1 = create(:user)
        user2 = create(:user)

        expected_value = [
          operator.to_vo.as_json,
          user1.to_vo.as_json,
          user2.to_vo.as_json
        ]

        get(users_url, headers: valid_header)
        expect(response.parsed_body).to match_array(expected_value)
      end
    end
  end

  describe 'GET /show' do
    context 'when operator has admin role' do
      let(:operator) { create(:user, role: :admin) }

      it 'renders a successful response' do
        target_user = create(:user, role: :general)
        patch user_path(target_user.id), params:
          { user: { id: target_user.id, role: 'admin' } }, headers: valid_header
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST /create' do
    context 'when operator has admin role' do
      let(:operator) { create(:user, role: :admin) }

      it 'has status 200' do
        post users_path, params: { user: { role: 'general' } }, headers: valid_header
        expect(response).to have_http_status(:ok)
      end

      it 'contains created user' do
        post users_path, params: { user: { role: 'general' } }, headers: valid_header
        expect(response.parsed_body.deep_symbolize_keys[:user]).to include(
          id: kind_of(Integer),
          role: 'general'
        )
      end

      it 'creates user' do
        expect do
          post users_path, params: { user: { role: 'general' } }, headers: valid_header
        end.to change(User, :count).by(1)
      end
    end

    context 'when operator has general role' do
      let(:operator) { create(:user, role: :general) }

      it 'requires admin role to operate' do
        post users_path, params: { user: { role: 'general' } }, headers: valid_header
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'PATCH /update' do
    context 'when operator has admin role' do
      let(:operator) { create(:user, role: :admin) }

      it 'has status 200' do
        target_user = create(:user, role: :general)
        patch user_path(target_user.id), params:
          { user: { id: target_user.id, role: 'admin' } }, headers: valid_header
        expect(response).to have_http_status(:ok)
      end

      it 'contains updated user' do
        target_user = create(:user, role: :general)
        patch user_path(target_user.id), params:
          { user: { id: target_user.id, role: 'admin' } }, headers: valid_header
        expect(response.parsed_body.deep_symbolize_keys[:user]).to include(
          id: target_user.id,
          role: 'admin'
        )
      end

      it 'updates user' do
        target_user = create(:user, role: :general)
        expect do
          patch user_path(target_user.id), params:
            { user: { id: target_user.id, role: 'admin' } }, headers: valid_header
        end.to change { target_user.reload.role }.from('general').to('admin')
      end
    end

    context 'when operator has general role' do
      let(:operator) { create(:user, role: :general) }

      it 'requires admin role to operate' do
        target_user = create(:user, role: :general)
        patch user_path(target_user.id), params:
          { user: { id: target_user.id, role: 'admin' } }, headers: valid_header
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when operator has admin role' do
      let(:operator) { create(:user, role: :admin) }

      it 'destroys the requested user' do
        target_user = create(:user, role: :general)
        expect do
          delete user_url(target_user.id), headers: valid_header
        end.to change(User, :count).by(-1)
      end

      it 'have status success' do
        user = User.create!(role: :general)
        delete user_url(user.id), headers: valid_header
        expect(response).to have_http_status(:ok)
      end

      it 'response contains nothing' do
        user = User.create(role: :general)
        delete user_url(user.id), headers: valid_header
        expect(response.parsed_body).to eq({})
      end

      it 'cannot delete admin' do
        user = User.create(role: :admin)
        delete user_url(user.id), headers: valid_header
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
