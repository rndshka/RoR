class Article < ActiveRecord::Base
  belongs_to :author
  has_many :articles_tags, dependent: :destroy
  has_many :tags, through: :articles_tags
  has_many :comments, dependent: :destroy
end
