# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::ApplicationVo, type: :vo do
  let(:test_class) do
    Class.new(::ApplicationVo) do
      attr_accessor :name

      def self.name
        'SampleVo'
      end
    end
  end

  it 'be expected values' do
    v = test_class.new
    v.name = 'alice'
    expect(v.name).to eql('alice')
  end
end
