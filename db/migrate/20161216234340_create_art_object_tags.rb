class CreateArtObjectTags < ActiveRecord::Migration[5.0]
  def change
    create_table :art_object_tags do |t|
      t.integer :tag_id
      t.integer :art_object_id
    end
  end
end
