class AddPlayedToCells < ActiveRecord::Migration[5.2]
  def change
    add_column :cells, :played, :boolean, default: false
  end
end
