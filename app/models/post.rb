class Post < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 15 }
  validates :content, presence: true

  belongs_to :category
  belongs_to :user
end
