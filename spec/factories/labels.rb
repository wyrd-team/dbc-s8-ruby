# frozen_string_literal: true

FactoryBot.define do
  factory :label do
    association :user, :general
    name { 'タスク' }
  end
end
