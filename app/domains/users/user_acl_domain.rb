# frozen_string_literal: true

module Users
  class UserAclDomain < ::Domain
    def self.can_find_users?(operator)
      operator.admin?
    end

    def self.can_show_user?(operator, target_user)
      return true if operator.admin?

      operator.general? && operator == target_user
    end

    def self.can_create_user?(operator)
      operator.admin?
    end

    def self.can_update_user?(operator, target_user)
      return true if operator.admin?

      operator.general? && operator == target_user
    end

    def self.can_delete_user?(operator, target_user)
      operator.admin? && target_user.general?
    end
  end
end
