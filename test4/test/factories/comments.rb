FactoryGirl.define do
  factory :comment do
    author
    article
    body {Faker::Lorem.paragraph}
  end

end
