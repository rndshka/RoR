# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do
  FactoryGirl.create(:author)
end

Author.all.each do |author|
  (1..10).to_a.sample.times do
    FactoryGirl.create(:article, author: author)
  end
end

20.times do
  FactoryGirl.create(:tag)
end

Article.all.each do |article|
  (0..3).to_a.sample.times do
    FactoryGirl.create(:articles_tag, article: article, tag: Tag.all.sample)
  end
end
