# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Users::CreateUserService, type: :service do
  subject(:result) do
    described_class.call(role: 'general')
  end

  it 'creates user' do
    expect { result }.to change(User, :count).by(1)
  end

  it 'contains created user' do
    expect(result).to have_attributes(
      id: kind_of(Integer),
      role: 'general'
    )
  end
end
