# frozen_string_literal: true

module Tasks
  class SearchTaskQuery < ::ApplicationQuery
    attribute :status, :string
    attribute :description, :string
  end
end
