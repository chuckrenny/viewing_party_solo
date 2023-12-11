class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :users_viewing_parties
  has_many :viewing_parties, through: :users_viewing_parties
end
