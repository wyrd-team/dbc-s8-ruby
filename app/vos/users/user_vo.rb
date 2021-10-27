# frozen_string_literal: true

module Users
  class UserVo < ApplicationVo
    attr_accessor :id, :role

    def admin?
      role == 'admin'
    end
  end
end
