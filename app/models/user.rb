class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password

  has_secure_password # automatically adds :password_confirmation attribute and validates
  has_many :users_viewing_parties
  has_many :viewing_parties, through: :users_viewing_parties
end
