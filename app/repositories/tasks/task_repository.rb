# frozen_string_literal: true

module Tasks
  class TaskRepository < ::ApplicationRepository
    def create(params)
      # TODO: 引数を要検討
      task = ::Task.create!(params)
      task.to_vo
    end
  end
end
