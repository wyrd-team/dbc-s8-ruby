# frozen_string_literal: true

class ApplicationVo
  include ActiveModel::Model
  include ActiveModel::Attributes

  def ==(other)
    other.is_a?(self.class) && attributes.eql?(other.attributes)
  end
end
