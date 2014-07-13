class Task < ActiveRecord::Base
  belongs_to :project
  has_many :links, dependent: :destroy

  accepts_nested_attributes_for :links, reject_if: proc { |attributes| attributes[:link].blank? }, 
                                allow_destroy: true

  default_scope -> { order('updated_at ASC') }

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 120 }
  validates :category, presence: true, :inclusion => 1..3
end
