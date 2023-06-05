require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a role' do
    subject.role = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    User.create!(name: 'Joe', email: 'test@example.com', password: 'password', role: :admin)
    subject.email = 'test@example.com'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password less than 6 characters' do
    subject.password = '12345'
    subject.password_confirmation = '12345'
    expect(subject).to_not be_valid
  end

  it 'has a role of regular by default' do
    expect(subject.role).to eq("regular")
  end

  it 'can have a role of admin' do
    subject.role = :admin
    expect(subject.role).to eq("admin")
  end

  it 'returns false when password does not match' do
    expect(subject.authenticate('wrongpassword')).to be false
  end

  it 'returns self when password matches' do
    expect(subject.authenticate('password')).to eq(subject)
  end
end
