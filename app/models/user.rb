# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks
  has_many :labels

  enum role: { general: 10, admin: 90 }

  def to_vo
    user_vo = ::Users::UserVo.new
    user_vo.id = id
    user_vo.role = role
    user_vo
  end
end
