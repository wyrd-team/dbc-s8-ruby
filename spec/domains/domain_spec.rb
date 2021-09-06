# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Domain, type: :domain do
  let(:test_class) do
    Class.new(::Domain) do
      attribute :attr1, :string
      attribute :attr2, :integer

      def self.name
        'SampleDomain'
      end

      def call
        {
          sample: {
            attr1: attr1,
            attr2: attr2
          }
        }
      end
    end
  end

  it 'Domain.call' do
    params = { attr1: 'foo', attr2: '13' }
    expect(test_class.call(params)).to eql({ sample: { attr1: 'foo', attr2: 13 } })
  end
end
