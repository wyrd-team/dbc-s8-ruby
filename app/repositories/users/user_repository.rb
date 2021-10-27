# frozen_string_literal: true

module Users
  class UserRepository < ApplicationRepository
    def index
      ::User.all.map(&:to_vo)
    end

    def show(user_id)
      user = ::User.find(user_id)
      user.to_vo
    end

    def create(role:)
      user = ::User.create!(role: role)
      user.to_vo
    end

    def update(user_id:, role:)
      user = ::User.find(user_id)
      user.update!(role: role)
      user.to_vo
    end

    def delete(user_id:)
      user = ::User.find(user_id)
      user.destroy!
    end

    def find_by_id(user_id:)
      user = ::User.find(user_id)
      return unless user

      user.to_vo
    end
  end
end
