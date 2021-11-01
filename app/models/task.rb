# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user

  enum priority: { low: 10, middle: 20, high: 30 }
  enum status: { not_started_yet: 10, in_progress: 20, completed: 90 }

  def to_vo
    task_vo = ::Tasks::TaskVo.new
    
    task_vo.id = id
    task_vo.expired_on = expired_on
    task_vo.priority = priority
    task_vo.status = status
    task_vo.user_id = user_id
    task_vo.name = name
    task_vo.description = description

    task_vo
  end
end
