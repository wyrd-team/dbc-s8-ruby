# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :user, :general
    expired_on { Date.current }
    priority { :middle }
    status { :not_started_yet }
    name { 'タスク名' }
    description { 'タスク説明' }

    trait :not_started_yet do
      status { :not_started_yet }
      description { '未着手' }
    end

    trait :in_progress do
      status { :in_progress }
      description { '着手中' }
    end

    trait :completed do
      status { :completed }
      description { '完了' }
    end
  end
end
