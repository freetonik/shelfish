class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :comment, presence: true

  belongs_to :user
end
