FactoryGirl.define do
  factory :branch do |branch|
    branch.name {"name_#{rand(1000).to_s}" }
  end

  factory :invalid_branch, parent: :branch do
    name nil
  end
end
