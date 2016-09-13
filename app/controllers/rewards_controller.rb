class RewardsController < BaseController
  def index
    @rewards = Reward.all
  end
end
