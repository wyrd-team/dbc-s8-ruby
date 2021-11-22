# frozen_string_literal: true

module Users
  class UserVo < ApplicationVo
    attribute :id, :integer
    attribute :role, :string

    def admin?
      role == 'admin'
    end
  end
end
