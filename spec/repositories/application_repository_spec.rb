# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::ApplicationRepository, type: :repository do
  let(:test_class) do
    Class.new(::ApplicationRepository) do
      def self.name
        'SampleRepository'
      end

      def sample_method
        'SampleRepositoryMethod'
      end
    end
  end

  it 'be expected values' do
    v = test_class.new
    expect(v.sample_method).to eql('SampleRepositoryMethod')
  end
end
