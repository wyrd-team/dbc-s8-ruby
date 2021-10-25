# frozen_string_literal: true

module Users
  class IndexUserService < ApplicationService
    # 操作するユーザID
    attribute :operated_by, :integer

    def call
      allowed = Users::UserAclDomain.can_find_users?(operator)

      if allowed
        ::Users::UserRepository.new.index
      else
        [::Users::UserRepository.new.show(operator.id)]
      end
    end

    private

    def operator
      Users::UserRepository.new.find_by_id(user_id: operated_by)
    end
  end
end
