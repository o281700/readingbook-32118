class Book < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :author, presence: true
end
