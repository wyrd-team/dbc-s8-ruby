# frozen_string_literal: true

module Users
  class UpdateUserService < ApplicationService
    # 作成するロール文字列
    attribute :user_id, :interger
    # 作成するロール文字列
    attribute :role, :string
    # 操作するユーザID
    attribute :operated_by, :integer

    def call
      raise ::Services::AuthError, '権限なし' unless operator.admin?

      # 更新周りはこんな感じ
      user = ::Users::UserRepository.new.find_by_id(user_id: user_id)
      ::Users::UserRepository.new.update(user, role: role)
    end

    private

    def operator
      ::Users::UserRepository.new.find_by_id(user_id: operated_by)
    end
  end
end
