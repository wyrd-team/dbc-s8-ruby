# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Tasks::SearchTaskService, type: :service do
  subject(:result) do
    described_class.call(operated_by: admin.id, query: query)
  end

  let(:admin) do
    create(:user, role: :admin)
  end

  let(:query) do
    ::Tasks::SearchTaskQuery.new(
      status: 'in_progress',
      description: 'abc'
    )
  end

  let!(:task) { create(:task, status: 'in_progress', description: 'abc', user: admin) } # ヒットするタスク

  before do
    create(:task, status: 'in_progress', description: 'def', user: admin) # ヒットしないタスク
    create(:task, status: 'not_started_yet', description: 'abc', user: admin) # ヒットしないタスク

    other_user = create(:user, :general)
    create(:task, :not_started_yet, user: other_user)
    create(:task, :in_progress, user: other_user)
    create(:task, :completed, user: other_user)
  end

  it 'search task' do
    expect(result).to eq([task.to_vo])
  end
end
