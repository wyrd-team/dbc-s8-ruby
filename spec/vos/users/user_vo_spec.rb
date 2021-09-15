# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Users::UserVo, type: :vo do
  let(:user_vo) do
    v = described_class.new
    v.id = 1
    v.role = 'general'
    v
  end

  it 'attrs' do
    expect(user_vo).to have_attributes(
      id: kind_of(Integer),
      role: 'general'
    )
  end
end
