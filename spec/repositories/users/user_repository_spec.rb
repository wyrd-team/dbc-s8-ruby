# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Users::UserRepository, type: :repository do
  describe ".create" do
    it 'aaa' do
      # TODO: テスト書く
      role = 'general'
      result = described_class.new.craete(role)
      expect(result).to be_a(::Users::UserVo)
    end
  end
end
