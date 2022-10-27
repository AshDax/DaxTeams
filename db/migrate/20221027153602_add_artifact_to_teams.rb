class AddArtifactToTeams < ActiveRecord::Migration[5.2]
  def change
    add_reference :artifacts, :team, foreign_key: true, default: ""
  end
end
