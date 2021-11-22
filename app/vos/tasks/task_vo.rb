# frozen_string_literal: true

module Tasks
  class TaskVo < ::ApplicationVo
    attribute :id, :integer
    attribute :expired_on, :datetime
    attribute :priority, :string
    attribute :status, :string
    attribute :user_id, :integer
    attribute :name, :string
    attribute :description, :string
  end
end
