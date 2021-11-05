class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :phone_number, presence: true
  has_many :blogs, dependent: :destroy
  has_many :cuts, dependent: :destroy
  has_many :colors, dependent: :destroy
  has_many :perms, dependent: :destroy

end
