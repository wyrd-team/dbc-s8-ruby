# frozen_string_literal: true

module Tasks
  class TaskVo < ::ApplicationVo
    attr_accessor :id, :expired_on, :priority, :status, :user_id, :name, :description
  end
end
