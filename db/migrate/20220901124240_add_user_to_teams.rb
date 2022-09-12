class AddUserToTeams < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :team, foreign_key: true, default: ""
  end
end
  