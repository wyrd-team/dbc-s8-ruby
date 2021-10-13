# frozen_string_literal: true

module Users
  class UpdateUserService < ApplicationService
    # 更新したいUserのid
    attribute :id, :integer
    # 作成するロール文字列
    attribute :role, :string
    # 操作するユーザID
    attribute :operated_by, :integer

    def call
      user = ::Users::UserRepository.new.find_by_id(user_id: id)

      allowed = Users::UserAclDomain.can_update_user?(operator, user)
      raise ::Services::AuthError, '権限なし' unless allowed

      # 更新周りはこんな感じ
      ::Users::UserRepository.new.update(user, role: role)
    end

    private

    def operator
      ::Users::UserRepository.new.find_by_id(user_id: operated_by)
    end
  end
end
