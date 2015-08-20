require 'rails_helper'

feature 'user can sign up' do

  it 'can sign up a valid user' do
    visit signup_path
    fill_in "user[name]", with: "Jessica"
    fill_in "user[email]", with: "j@gmail.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Create my account"

    expect(page).to have_content("Jessica")
  end

  it 'cannot sign up a user without a name' do
    visit signup_path
    fill_in "user[name]", with: ""
    fill_in "user[email]", with: "j@gmail.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Create my account"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Name can't be blank")
  end

  it 'cannot sign up a user without an email' do
    visit signup_path
    fill_in "user[name]", with: "jess"
    fill_in "user[email]", with: ""
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Create my account"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Email can't be blank")
  end

end
