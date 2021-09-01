# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Label, type: :model do
  let(:label) { create(:label) }

  it 'ラベルが作成できること' do
    expect(label.name).to eq('タスク')
  end
end
