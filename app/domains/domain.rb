# frozen_string_literal: true

class Domain
  include ActiveModel::Model
  include ActiveModel::Attributes

  def self.call(...)
    new(...).call
  end

  def call
    raise NotImplementedError
  end
end
