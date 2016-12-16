class CreateCollectionArtObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :collection_art_objects do |t|
      t.integer :collection_id
      t.integer :art_object_id
    end
  end
end
