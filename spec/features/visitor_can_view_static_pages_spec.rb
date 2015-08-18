require 'rails_helper'

feature 'visitor can view static pages' do
  it 'can view the home page' do
    visit static_pages_home_path

    expect(page).to have_content('Home')
  end

  it 'can view the help page' do
    visit static_pages_help_path

    expect(page).to have_content('Help')
  end

  it 'can view the about page' do
    visit static_pages_about_path

    expect(page).to have_content('About')
  end
end
