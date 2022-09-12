class Team < ApplicationRecord
    has_many :users
    belongs_to :organization
    has_and_belongs_to_many :artifacts, optional: true
end
 