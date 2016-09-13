require 'rails_helper'

RSpec.feature "User can loggin" do
  scenario "a registered user can login" do
    user = create :user, password: "test"
    visit login_path

    fill_in "Username", with: "aUserName"
    fill_in "Password", with: "test"
    click_button "Login"

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("aUserName")
  end
end
