class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :sport
      t.integer :trophies

      t.timestamps
    end
  end
end
