class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :author, presence: true
end
