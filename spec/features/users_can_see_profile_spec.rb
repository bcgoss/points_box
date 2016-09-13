require 'rails_helper'

RSpec.feature "users can see profile" do
  context "when logged in" do
    scenario "I can see my own profile" do
      #as a user
      #assuming I have created an account
      user = create :user_with_reward
      #and I am logged in
      visit login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Login"
      #when I visit my user page
      visit profile_path
      #I expect to see my user name
      expect(page).to have_content( user.username )
      #and I should see my points earned
      expect(page).to have_content( user.points_earned )
      #and I should see my points spent
      expect(page).to have_content( user.points_spent )
      #and I should see my rewards
      expect(page).to have_content( user.rewards.first.name )
    end
  end
end
