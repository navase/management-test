FactoryGirl.define do
  factory :registration do
    start_date "2016-03-18"
    end_date "2016-03-18"
    consumption_data 1
    verified false
    branch_id 1
  end

  factory :invalid_registration, parent: :registration do
    start_date nil
  end
end
