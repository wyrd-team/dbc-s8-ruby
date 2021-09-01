# frozen_string_literal: true

FactoryBot.define do
  factory :label do
    association :user
    name { 'タスク' }
  end
end
