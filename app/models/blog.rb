class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 15 }
  validates :content, presence: true, length: { minimum: 1, maximum: 200 }

  belongs_to :user
end
