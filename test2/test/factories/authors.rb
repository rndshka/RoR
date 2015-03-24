FactoryGirl.define do
  factory :author do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    birthday {Date::today - (15..60).to_a.sample.day}
  end
end
