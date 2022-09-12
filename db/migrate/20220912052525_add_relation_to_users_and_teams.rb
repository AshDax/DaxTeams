class AddRelationToUsersAndTeams < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :organization, foreign_key: true, default: 1
    add_reference :teams, :organization, foreign_key: true, default: 1
  end
end
