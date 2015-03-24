FactoryGirl.define do
  factory :article do
    author
    title {Faker::Lorem.word}
    body {Faker::Lorem.paragraph(2)}

    after(:create) do |article|
      (1..10).to_a.sample.times do
        FactoryGirl.create(:comment, article: article)
      end
    end
  end

end
