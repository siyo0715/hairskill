class Color < ApplicationRecord
  belongs_to :user
  attachment :image

  validates :title, presence: true
  validates :detail, presence: true
  validates :color_image, presence: true

end
