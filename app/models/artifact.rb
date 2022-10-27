class Artifact < ApplicationRecord
    belongs_to :team, optional: true
    belongs_to :organization
end
  