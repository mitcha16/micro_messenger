require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user = User.new(name: "Mitch", email: "mashby@aol.com",
                        password: "password", password_confirmation: "password")
  end

  after(:all) do
    User.delete_all
  end

  it 'can have a name' do
    expect(@user.name).to eq("Mitch")
  end

  it 'can have a email' do
    expect(@user.email).to eq("mashby@aol.com")
  end

  it 'can have a valid user' do
    assert @user.valid?
  end

  it 'cannot create a user without a name' do
    user = User.new(email: "mashby1@aol.com",
                    password: "password", password_confirmation: "password")

    refute user.valid?
  end

  it 'cannot create a user without an email address' do
    user = User.new(name: "Joe",
                    password: "password", password_confirmation: "password")

    refute user.valid?
  end

  it 'cannot create a user with an invalid email' do
    user = User.new(name: "Josh", email: "@,1234$$[]",
                    password: "password", password_confirmation: "password")

    refute user.valid?
  end

  it 'cannot create a user with the same username' do
    @user.save
    user = User.create(name: "Mitch", email: "Mitch@gmail.com",
                      password: "password", password_confirmation: "password")

    refute user.valid?
  end

end
