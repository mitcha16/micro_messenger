require 'rails_helper'

feature 'visitor can view static pages' do
  it 'can view the home page' do
    visit root_path

    expect(page).to have_content('Welcome')
  end

  it 'can view the help page' do
    visit help_path

    expect(page).to have_content('Help')
  end

  it 'can view the about page' do
    visit about_path

    expect(page).to have_content('About')
  end
end
