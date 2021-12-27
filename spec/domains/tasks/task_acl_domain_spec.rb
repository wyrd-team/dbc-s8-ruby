# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Tasks::TaskAclDomain, type: :domain do
  describe 'can_search_user?' do
    it 'always be true' do
      actual = described_class.can_search_user?
      expect(actual).to be_truthy
    end
  end
end
