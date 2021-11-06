class Color < ApplicationRecord
  belongs_to :user
  attachment :color_image

  validates :title, presence: true
  validates :detail, presence: true
  validates :evaluation, presence: true
  validates :color_image, presence: true

end
