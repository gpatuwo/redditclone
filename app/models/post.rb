class Post < ActiveRecord::Base

  belongs_to :sub
  belongs_to :author, primary_key: :id, foreign_key: :author_id, class_name: :User

  validates :title, :url, :content, :sub_id, :author_id, presence: true
end
