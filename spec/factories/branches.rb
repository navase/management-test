FactoryGirl.define do
  factory :branch do
    name "MyString"
  end

  factory :invalid_branch, parent: :branch do
    name nil
  end
end
