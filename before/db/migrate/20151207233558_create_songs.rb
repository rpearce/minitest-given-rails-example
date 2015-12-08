class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :artist_id, null: false
      t.string :title

      t.timestamps null: false
    end

    add_index :songs, :artist_id
  end
end
