class Article < ActiveRecord::Base
  belongs_to :author
  has_many :articles_tags
  has_many :tags, through: :articles_tags
end
