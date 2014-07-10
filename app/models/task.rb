class Task < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('updated_at ASC') }

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 120 }
  validates :category, presence: true, :inclusion => 1..3
end
