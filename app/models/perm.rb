class Perm < ApplicationRecord
  belongs_to :user
  attachment :image

  validates :title, presence: true
  validates :detail, presence: true
  validates :perm_image, presence: true
end
