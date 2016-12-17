class CreateTagCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_collections do |t|
      t.integer :tag_id
      t.integer :collection_id
    end
  end
end
