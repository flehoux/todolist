class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 60 }
  validates :category, presence: true, :inclusion => 1..3
end
