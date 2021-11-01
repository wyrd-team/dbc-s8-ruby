# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Tasks::TaskRepository, type: :repository do
  let(:user) { create(:user) }

  describe '.create' do
    let(:params) do
      {
        expired_on: '2021-11-01',
        priority: 'low',
        status: 'not_started_yet',
        user_id: user.id,
        name: 'タスク名',
        description: 'タスク説明'
      }
    end

    it 'persists user' do
      expect do
        described_class.new.create(params)
      end.to change(::Task, :count).by(1)
    end

    it 'returns UserVo' do
      result = described_class.new.create(params)
      expect(result).to be_a(::Tasks::TaskVo)
    end

    it 'has params' do
      result = described_class.new.create(params)
      expect(result).to have_attributes(
        id: kind_of(Integer),
        expired_on: Date.parse('2021-11-01'),
        priority: 'low',
        status: 'not_started_yet',
        user_id: user.id,
        name: 'タスク名',
        description: 'タスク説明'
      )
    end
  end
end
