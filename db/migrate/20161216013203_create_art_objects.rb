class CreateArtObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :art_objects do |t|
      t.integer 'museum_id'
      t.integer 'medium_id'
      t.string 'title'
      t.string 'date'
      t.string 'artist'
      t.string 'description'
      t.string 'dimensions'
      t.string 'thumbnail_url'
      t.string 'image_url'
      t.string 'place'
      t.string 'link_to_object'
      t.string 'credit_line'

      t.timestamps
    end
  end
end
