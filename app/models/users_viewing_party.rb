class UsersViewingParty < ApplicationRecord
  validates_inclusion_of :hosting?, in: [true, false]

  belongs_to :user
  belongs_to :viewing_party
end