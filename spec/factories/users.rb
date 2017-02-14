FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  sequence :name do |n|
    "user#{n}"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    name
    email
    password '12345678'
    password_confirmation '12345678'
    confirmed_at Time.zone.now
  end
end