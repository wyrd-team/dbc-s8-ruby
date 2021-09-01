# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'データが生成できること' do # TODO: FactoryBotのテスト用。正式なmodel specが作れるようになったら削除してよい
    expect(user.role).to eq 0
  end
end
