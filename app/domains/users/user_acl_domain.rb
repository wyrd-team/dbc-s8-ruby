# frozen_string_literal: true

module Users
  class UserAclDomain < ::Domain
    def self.can_create_user?(operator)
      operator.admin?
    end

    def self.can_update_user?(operator, target_user)
      case operator.role
      when 'admin'
        true
      when 'general'
        operator == target_user
      end
    end

    def self.can_delete_user?(operator, target_user)
      operator.admin? && target_user.general?
    end
  end
end
