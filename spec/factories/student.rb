FactoryGirl.define do
  factory :student do
    name 'Luca'
    email { "#{name.capitalize}@example.com" }
  end
end
