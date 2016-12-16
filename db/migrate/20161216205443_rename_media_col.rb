class RenameMediaCol < ActiveRecord::Migration[5.0]
  def change
    rename_column :media, :type, :medium_type
  end
end
