class AddRelationsToArtifacts < ActiveRecord::Migration[5.2]
  def change
      add_reference :artifacts, :organization, foreign_key: true, default: 1
  end
end
