# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create(:task) }

  it 'データが生成できること' do # TODO: FactoryBotのテスト用。正式なmodel specが作れるようになったら削除してよい
    expect(task.name).to eq 'タスク名'
  end
end
