class Perm < ApplicationRecord
  belongs_to :user
  attachment :perm_image

  validates :title, presence: true, length: { minimum: 1, maximum: 20 }
  validates :detail, presence: true, length: { minimum: 1, maximun: 500 }
  validates :evaluation, presence: true
  validates :perm_image, presence: true
end
