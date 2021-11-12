class Contact < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 15 }
  validates :email, presence: true, length: { minimum: 1, maximum: 50 }
  validates :phone_number, presence: true, length: { minimum: 1, maximum: 15 }
  validates :subject, presence: true, length: { minimum: 1, maximum: 11 }
  validates :message, presence: true, length: { minimum: 1, maxmum: 200 }
end
