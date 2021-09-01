# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    role { 0 } # TODO: enum設定後に要変更
  end
end
