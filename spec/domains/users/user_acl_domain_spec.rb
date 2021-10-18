# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Users::UserAclDomain, type: :domain do
  let(:admin_user) do
    create(:user, role: :admin)
  end
  let(:another_admin_user) do
    create(:user, role: :admin)
  end
  let(:general_user) do
    create(:user, role: :general)
  end
  let(:another_general_user) do
    create(:user, role: :general)
  end

  describe '.can_create_user?' do
    it 'with admin user should be true' do
      actual = described_class.can_create_user?(admin_user)
      expect(actual).to be_truthy
    end

    it 'with none admin user should be true' do
      actual = described_class.can_create_user?(general_user)
      expect(actual).to be_falsey
    end
  end

  describe '.can_update_user?' do
    it 'with admin, admin' do
      actual = described_class.can_update_user?(admin_user, admin_user)
      expect(actual).to be_truthy
    end

    it 'with admin, another admin' do
      actual = described_class.can_update_user?(admin_user, another_admin_user)
      expect(actual).to be_truthy
    end

    it 'with admin, general' do
      actual = described_class.can_update_user?(admin_user, general_user)
      expect(actual).to be_truthy
    end

    it 'with general, general' do
      # 自身の更新
      actual = described_class.can_update_user?(general_user, general_user)
      expect(actual).to be_truthy
    end

    it 'with general, another general' do
      # 他人の更新
      actual = described_class.can_update_user?(general_user, another_general_user)
      expect(actual).to be_falsey
    end
  end

  describe '.can_delete_user?' do
    it 'with admin, admin' do
      actual = described_class.can_delete_user?(admin_user, admin_user)
      expect(actual).to be_falsey
    end

    it 'with admin, another admin' do
      actual = described_class.can_delete_user?(admin_user, another_admin_user)
      expect(actual).to be_falsey
    end

    it 'with admin, general' do
      actual = described_class.can_delete_user?(admin_user, general_user)
      expect(actual).to be_truthy
    end

    it 'with general, another general' do
      # 他人の削除
      actual = described_class.can_delete_user?(general_user, another_general_user)
      expect(actual).to be_falsey
    end
  end
end
