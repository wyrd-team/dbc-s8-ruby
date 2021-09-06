# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks
  has_many :labels

  enum role: { general: 10, admin: 90 }
end
