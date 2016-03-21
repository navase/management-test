FactoryGirl.define do
  factory :user do |user|
    user.email {"user_#{rand(1000).to_s}@factory.com" }
    user.password "userspec@test.nl"
  end
end
