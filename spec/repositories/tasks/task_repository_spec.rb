# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Tasks::TaskRepository, type: :repository do
  let(:user) { create(:user, :general) }

  describe '.search' do
    before do
      create(:task, :not_started_yet, user: user)
      create(:task, :in_progress, user: user)
      create(:task, :completed, user: user)

      other_user = create(:user, :general)
      create(:task, :not_started_yet, user: other_user)
      create(:task, :in_progress, user: other_user)
      create(:task, :completed, user: other_user)
    end

    let(:params) { { status: nil, description: nil, operated_by: user.id } }
    let(:params_without_description) { { status: :not_started_yet, description: nil, operated_by: user.id } }
    let(:params_without_status) { { status: nil, description: '未着手', operated_by: user.id } }

    it 'return Array of TaskVo' do
      results = described_class.new.search(params)
      expect(results).to be_a(Array)
      expect(results[0]).to be_a(::Tasks::TaskVo)
    end

    it 'contain status not_started_yet' do
      results = described_class.new.search(params_without_description)
      expect(results.map(&:status)).to eq(['not_started_yet'])
    end

    it 'contain description 未着手' do
      results = described_class.new.search(params_without_status)
      expect(results.map(&:description)).to contain_exactly('未着手')
    end

    it 'contain status not_started_yet and description 未着手' do
      results = described_class.new.search(params_without_description)
      expect(results.map(&:status)).to contain_exactly('not_started_yet')
      expect(results.map(&:description)).to contain_exactly('未着手')
    end
  end

  describe '.create' do
    let(:params) do
      ::Tasks::TaskVo.new(
        expired_on: '2021-11-01',
        priority: 'low',
        status: 'not_started_yet',
        user_id: user.id,
        name: 'タスク名',
        description: 'タスク説明'
      )
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
