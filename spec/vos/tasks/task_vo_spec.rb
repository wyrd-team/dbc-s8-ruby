# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Tasks::TaskVo, type: :vo do
  let(:task_vo) do
    v = described_class.new
    v.id = 1
    v.expired_on = Date.new
    v.priority = :low
    v.status = :not_started_yet
    v.user_id = 1
    v.name = 'sample user'
    v.description = 'sample task'
    v
  end

  it 'attrs' do
    expect(task_vo).to have_attributes(
      id: kind_of(Integer),
      expired_on: kind_of(Date),
      priority: 'low',
      status: 'not_started_yet',
      user_id: kind_of(Integer),
      name: 'sample user',
      description: 'sample task'
    )
  end
end
