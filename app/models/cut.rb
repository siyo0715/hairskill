class Cut < ApplicationRecord
  belongs_to :user
  attachment :cut_image

  validates :title, presence: true
  validates :detail, presence: true
  validates :cut_image, presence: true
end
