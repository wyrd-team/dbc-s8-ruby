# frozen_string_literal: true

module Users
  class CreateUserService < ApplicationService
    # 作成するロール文字列
    attribute :role, :string
    # 操作するユーザID
    attribute :operated_by, :integer

    def call
      raise ::Services::AuthError, '権限なし' if operator.admin?

      ::UserRepository.create(role: role)
    end

    private

    def operator
      ::UserRepository.find_by_id(user_id: operated_by)
    end
  end
end
