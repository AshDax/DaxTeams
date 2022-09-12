class Artifact < ApplicationRecord
    has_and_belongs_to_many :teams, optional: true
    belongs_to :organization
end
  