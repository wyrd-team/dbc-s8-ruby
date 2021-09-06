# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, :general) }

  it 'データが生成できること' do # TODO: FactoryBotのテスト用。正式なmodel specが作れるようになったら削除してよい
    expect(user.role).to eq 'general'
  end
end
