# frozen_string_literal: true

module Tasks
  class CreateTaskService < ApplicationService
    # 作成するロール文字列
    attribute :description, :string
    attribute :expired_on, :datetime
    attribute :id, :integer
    attribute :name, :string
    attribute :priority, :string
    attribute :role, :string
    attribute :status, :string
    attribute :user_id, :integer

    # 操作するユーザID
    attribute :operated_by, :integer

    def call
      allowed = Tasks::TaskAclDomain.can_create_user?
      raise ::Services::AuthError, '権限なし' unless allowed

      task_vo = ::Tasks::TaskVo.new(
        expired_on: expired_on,
        priority: priority,
        status: status,
        user_id: user_id,
        name: name,
        description: description
      )
      ::Tasks::TaskRepository.new.create(task_vo)
    end

    private

    def operator
      ::Users::UserRepository.new.find_by_id(user_id: operated_by)
    end
  end
end
