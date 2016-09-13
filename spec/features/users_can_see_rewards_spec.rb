require 'rails_helper'

RSpec.feature "Users can see rewards" do
  context "When not logged in" do
    scenario "visiter wants to see rewards" do
      #as a visiter
      #given rewards exist
      reward = create :reward
      #when I visit '/rewards'
      visit '/rewards'
      #I expect to see the rewards
      expect(page).to have_content("Reward Number")
      #and I expect to not see a purchase button
      expect(page).to_not have_content("Purchase")
    end
  end

  context "When logged in" do
    scenario "user wants to see rewards" do
      pending "impliment user"
      #as a visiter
      #given rewards exist
      reward = create :reward
      #when I visit '/rewards'
      visit '/rewards'
      #I expect to see the rewards
      expect(page).to have_content("Reward Number")
      #and I expect to see a purchase button
      expect(page).to have_content("Purchase")
      # but I expect not to see a purchase button if the reward is too expencive
      expect(page).to_not have_content("Purchase")
    end
  end
end
