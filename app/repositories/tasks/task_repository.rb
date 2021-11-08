# frozen_string_literal: true

module Tasks
  class TaskRepository < ::ApplicationRepository
    def create(task_vo)
      task = ::Task.create!(task_vo.attributes)
      task.to_vo
    end
  end
end
