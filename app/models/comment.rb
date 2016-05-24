class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :content, presence: true, length: {maximum: 50}
end
