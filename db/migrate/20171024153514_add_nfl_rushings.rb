class AddNflRushings < ActiveRecord::Migration
  def up
    create_table :nfl_rushings do |t|
      t.string  :player
      t.string  :team
      t.string  :pos
      t.integer :att
      t.float   :att_g
      t.integer :yds
      t.float   :avg
      t.float   :yds_g
      t.integer :td
      t.string  :lng
      t.integer :first_down
      t.float   :first_down_percent
      t.integer :yards_20
      t.integer :yards_40
      t.integer :fum
      t.timestamps
    end
    
    # We are searching by player, so we will index it
    # we will modify this as the requirements change
    add_index :nfl_rushings, :player, :name => 'player_idx'
  end
  
  def down
    drop_table :nfl_rushings rescue nil 
  end
end
