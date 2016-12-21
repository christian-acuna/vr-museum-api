class AddVrImageToArtObjects < ActiveRecord::Migration[5.0]
  def change
    add_column :art_objects, :vr_url, :string
  end
end
