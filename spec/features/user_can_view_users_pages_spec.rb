require 'rails_helper'

feature 'user can view user pages' do

  it 'has a user index page' do
    visit users_path

    expect(current_path).to eq('/users')
  end

  it 'has a signup page' do
    visit signup_path

    expect(page).to have_content("Sign up")
  end

end
