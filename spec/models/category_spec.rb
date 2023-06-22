require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { build(:category) }

  describe 'validations' do
    it { should validate_presence_of(:description) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid with a duplicate code' do
      create(:category, code: '123')
      subject.code = '123'
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'database columns' do
    it { should have_db_column(:description).of_type(:string) }
    it { should have_db_column(:code).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end
end
