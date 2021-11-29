# frozen_string_literal: true

module Tasks
  class SearchTaskService < ApplicationService
    attribute :query, ::ActiveModel::Type::Value.new
    # 操作するユーザID
    attribute :operated_by, :integer

    validate :query, lambda { |service|
      return if service.query.is_a?(::Tasks::SearchTaskQuery)

      errors.add(:base, 'Must be friends to leave a comment')
    }

    def call
      allowed = Tasks::TaskAclDomain.can_search_user?
      raise ::Services::AuthError, '権限なし' unless allowed

      ::Tasks::TaskRepository.new.search(
        status: query.status,
        description: query.description,
        operated_by: operated_by
      )
    end

    private

    def operator
      ::Users::UserRepository.new.find_by_id(user_id: operated_by)
    end
  end
end
