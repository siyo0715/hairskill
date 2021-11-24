class Cut < ApplicationRecord
  belongs_to :user
  attachment :cut_image

  validates :title, presence: true, length: { minimum: 1, maximum: 20 }
  validates :detail, presence: true, length: { minimum: 1, maximum: 500 }
  validates :evaluation, presence: true
  validates :cut_image, presence: true

  def self.search(search)
    if search
      where(['title LIKE?', "%#{search}%"])
    else
      all
    end
  end
end
