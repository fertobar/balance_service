require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  context 'validations' do
    it 'validates presence of email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'validates uniqueness of email' do
      user2 = FactoryBot.build(:user, email: user.email)
      expect(user2).not_to be_valid
    end

    it 'validates presence of name' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'validates presence of role' do
      user.role = nil
      expect(user).not_to be_valid
    end

    it 'validates presence of password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'validates length of password' do
      user.password = '12345'
      expect(user).not_to be_valid
    end
  end

  context 'devise modules' do
    it 'should have :database_authenticatable module' do
      expect(User.ancestors).to include(Devise::Models::DatabaseAuthenticatable)
    end

    it 'should have :trackable module' do
      expect(User.ancestors).to include(Devise::Models::Trackable)
    end

    it 'should have :recoverable module' do
      expect(User.ancestors).to include(Devise::Models::Recoverable)
    end

    it 'should have :rememberable module' do
      expect(User.ancestors).to include(Devise::Models::Rememberable)
    end

    it 'should have :validatable module' do
      expect(User.ancestors).to include(Devise::Models::Validatable)
    end
  end


  context 'roles' do
    it 'should have a role attribute' do
      expect(user.attributes).to include('role')
    end

    it 'should allow role to be set to :admin' do
      user.admin!
      expect(user.role).to eq('admin')
    end

    it 'should allow role to be set to :regular' do
      user.regular!
      expect(user.role).to eq('regular')
    end
  end
end