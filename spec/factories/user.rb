# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    trait :general do
      role { :general }
    end

    trait :admin do
      role { :admin }
    end
  end
end
