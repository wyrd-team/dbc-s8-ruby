# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :user, :general
    expired_on { Date.current }
    priority { :middle }
    status { :not_started_yet }
    name { 'タスク名' }
    description { 'タスク説明' }
  end
end
