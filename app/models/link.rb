class Link < ActiveRecord::Base
  belongs_to :task

  VALID_URL_REGEX = /\A((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/ix
  validates :link, format: { with: VALID_URL_REGEX }
end
