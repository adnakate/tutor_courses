FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryBot.define do
  factory :tutor, :class => 'Tutor' do
    first_name "first"
    last_name "last"
    association :course
    email
  end
end
