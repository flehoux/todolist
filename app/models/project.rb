class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 120 }
end
