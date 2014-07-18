class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


  has_many :partnerships, dependent: :destroy
  has_many :projects, :through => :partnerships

  retina!
  has_attached_file :photo, styles: { :thumb => '40x40' }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.search(search)
    if search && !search.empty?
      where('email LIKE ?', "%#{search}%")
    end
  end
end