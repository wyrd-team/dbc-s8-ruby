# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :user
    expired_on { Date.current }
    priority { 0 } # TODO: enum設定後に要変更
    status { 0 } # TODO: enum設定後に要変更
    name { 'タスク名' }
    description { 'タスク説明' }
  end
end
