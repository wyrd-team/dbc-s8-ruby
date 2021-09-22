# frozen_string_literal: true

module Users
  class CreateUserService < ApplicationService
    attribute :role, :string

    def call
      user = ::User.create!(role: role)
      user_vo = ::Users::UserVo.new
      user_vo.id = user.id
      user_vo.role = user.role
      user_vo
    end
  end
end
