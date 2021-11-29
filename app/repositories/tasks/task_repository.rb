# frozen_string_literal: true

module Tasks
  class TaskRepository < ::ApplicationRepository
    def search(status:, description:, operated_by:)
      tasks = ::Task.where(user_id: operated_by)
      tasks = tasks.where(status: status) if status.present?
      tasks = tasks.where('description like ? ', description) if description.present?

      tasks.map(&:to_vo)
    end

    def create(task_vo)
      task = ::Task.create!(task_vo.attributes)
      task.to_vo
    end
  end
end
