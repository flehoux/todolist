class Project < ActiveRecord::Base
  has_many :partnerships, dependent: :destroy
  has_many :users, :through => :partnerships
  has_many :tasks, dependent: :destroy

  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 120 }
end
