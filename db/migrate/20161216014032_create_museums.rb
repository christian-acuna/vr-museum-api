class CreateMuseums < ActiveRecord::Migration[5.0]
  def change
    create_table :museums do |t|
      t.string :name, :location, :url
      t.timestamps
    end
  end
end
