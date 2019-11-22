class CreateArtWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :art_works do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false
      t.timestamps

    # add_index :artworks, :artist_id, unique: true
    
    end
      add_index :art_works, [:artist_id, :title], unique: true
  end
end
