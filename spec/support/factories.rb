FactoryGirl.define do
  factory :reward do
    name { generate :reward_name}
    value { generate :reward_value}
  end

  sequence :reward_name do |n|
     "Reward Number #{n}"
   end

  sequence :reward_value, [100,200,300].cycle do |n|
     n
   end

  factory :points do
    name "Some Points"
    value { generate :points_value}
    user
    status 0
  end

  sequence :points_value, [100, 200, 300].cycle do |n|
    n
  end

  factory :user do
    username "aUserName"
    password "aPassword"

    factory :user_with_reward do
      transient do
        reward_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:reward, evaluator.reward_count, users: [user])
      end
    end
  end


end
