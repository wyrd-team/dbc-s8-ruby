# frozen_string_literal: true

module Tasks
  class TaskAclDomain < ::Domain
    def self.can_create_user?
      # 作成時は権限関係なく作成できる
      true
    end

    def self.can_search_user?
      true
    end
  end
end
