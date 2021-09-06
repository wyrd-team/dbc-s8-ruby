# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user

  enum priority: { low: 10, middle: 20, high: 30 }
  enum status: { not_started_yet: 10, in_progress: 20, completed: 90 }
end
