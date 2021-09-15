# frozen_string_literal: true

module Users
  class UserRepository < ApplicationRepository
    def craete(role)
      # TODO
      # user = ::User.create!(role: role)
      user_vo = ::Users::UserVo.new
      user_vo
    end
  end
end
