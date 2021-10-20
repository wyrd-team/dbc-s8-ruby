# frozen_string_literal: true

module Users
  class UserRepository < ApplicationRepository
    def create(role:)
      user = ::User.create!(role: role)
      ar2vo(user)
    end

    def update(user_id:, role:)
      user = ::User.find(user_id)
      user.update!(role: role)
      ar2vo(user)
    end

    def delete(user_id:)
      user = ::User.find(user_id)
      user.destroy!
    end

    def find_by_id(user_id:)
      user = ::User.find(user_id)
      return unless user

      ar2vo(user)
    end

    private

    def ar2vo(user)
      return unless user

      user_vo = ::Users::UserVo.new
      user_vo.id = user.id
      user_vo.role = user.role
      user_vo
    end
  end
end
