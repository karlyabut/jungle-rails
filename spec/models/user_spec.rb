require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do #initialize each test with empty User
    @user = User.new()
  end

  it 'with name' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:name]).to include("can't be blank")
  end

  it 'with email' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:email]).to include("can't be blank")
  end
  
  it 'with password' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:password]).to include("can't be blank")
  end

  it 'with password confirmation' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:password_confirmation]).to include("can't be blank")
  end

  it 'with password, password_confirmation and it matches' do
    @user_with_password_password_confirm_match = User.new(name: 'Some person', email: 'that@person.com', password: 'password', password_confirmation: 'password')
    @user_with_password_password_confirm_not_match = User.new(name: 'Some person', email: 'that@person.com', password: 'password', password_confirmation: 'drowssap')
    
    @user_with_password_password_confirm_match.save
    @user_with_password_password_confirm_not_match.save

    expect(@user_with_password_password_confirm_match[:id]).to be_present #save successful if theres an id
    expect(@user_with_password_password_confirm_not_match[:id]).to_not be_present #save fails if theres no id
  end

  it 'too short' do
    @user_with_short_password = User.new(name: 'Some person', email: 'that@person.com', password: 'pass', password_confirmation: 'pass')
    @user_with_short_password.save
    expect(@user_with_short_password).to_not be_valid
    expect(@user_with_short_password.errors.messages[:password]).to include("is too short (minimum is 6 characters)")
    expect(@user_with_short_password.errors.messages[:password_confirmation]).to include("is too short (minimum is 6 characters)")
  end

  it 'unique email' do
    @user_valid = User.new(name: 'that person', email: 'that@person.com', password: 'password', password_confirmation: 'password')
    @user_invalid = User.new(name: 'some person', email: 'that@person.com', password: 'password', password_confirmation: 'password')
    @user_valid.save
    @user_invalid.save
    expect(@user_valid).to be_valid
    expect(@user_invalid).to_not be_valid
    expect(@user_invalid.errors.messages[:email]).to include("has already been taken")
  end

end
