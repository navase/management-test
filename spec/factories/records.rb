FactoryGirl.define do
  factory :record do
    start_date "2016-03-18"
    end_date "2016-03-18"
    consumption_data 1
    verified false
    branch_id 1
  end

  factory :invalid_recorn, parent: :record do
    start_date nil
  end
end
