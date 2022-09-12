class Organization < ApplicationRecord
    has_many :teams
    has_many :users
    has_many :artifacts
end
