# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Users::UserRepository, type: :repository do
  describe '.create' do
    let(:role) { 'general' }

    it 'persists user' do
      expect do
        described_class.new.create(role: role)
      end.to change(::User, :count).by(1)
    end

    it 'returns UserVo' do
      result = described_class.new.create(role: role)
      expect(result).to be_a(::Users::UserVo)
    end

    it 'has id and role' do
      result = described_class.new.create(role: role)
      expect(result).to have_attributes(
        id: kind_of(Integer),
        role: role
      )
    end
  end
end
