require 'rails_helper'

feature 'user can view user pages' do

  it 'has a user index page' do
    visit users_path

    expect(current_path).to eq('/users')
  end

end
