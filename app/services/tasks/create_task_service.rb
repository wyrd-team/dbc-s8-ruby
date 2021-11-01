# frozen_string_literal: true

module Tasks
  class CreateTaskService < ApplicationService
    # 作成するロール文字列
    attribute :role, :string
    # TODO: 型をどうするか検討する
    attribute :expired_on, :string
    attribute :priority, :string
    attribute :status, :string
    attribute :user_id, :string
    attribute :name, :string
    attribute :description, :string

    # 操作するユーザID
    attribute :operated_by, :integer

    def call
      allowed = Tasks::TaskAclDomain.can_create_user?(operator)
      raise ::Services::AuthError, '権限なし' unless allowed

      # TODO: 引数を正しく指定する
      ::Tasks::TaskRepository.new.create(role: role)
    end

    private

    def operator
      ::Users::UserRepository.new.find_by_id(user_id: operated_by)
    end
  end
end
