class CreateJoinTableTeamsArtifacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teams, :artifacts do |t|
      # t.index [:team_id, :artifact_id]
      # t.index [:artifact_id, :team_id]
    end
  end
end
