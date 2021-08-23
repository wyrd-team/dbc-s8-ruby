require 'rails_helper'

RSpec.describe ::ApplicationService, type: :service do
  let(:test_class) do
    Class.new(::ApplicationService) do
      def self.name
        'SampleService'
      end

      def call
        'Sample'
      end
    end
  end

  it 'ApplicationService.call' do
    expect(test_class.call).to eql('Sample')
  end
end
