require 'rails_helper'

feature 'user can login' do
  it "can login with valid information" do
    User.create(name: "Jessica", email: "j@gmail.com", password: "password", password_confirmation: "password")
    visit '/login'
    fill_in "Email", with: "j@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content("Jessica")
  end
end
