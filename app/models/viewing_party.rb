class ViewingParty < ApplicationRecord
  validates :movie_id, :movie_title, :duration, :date, :start_time, presence: true

  has_many :users_viewing_parties
  has_many :users, through: :users_viewing_parties
end