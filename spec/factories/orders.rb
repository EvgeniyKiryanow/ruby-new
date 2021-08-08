FactoryBot.define do
  factory :order do
    association :user, factory: :user
    total { 1 }
  end
end