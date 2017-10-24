class AddNflRushings < ActiveRecord::Migration
  def change
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
  end
end
