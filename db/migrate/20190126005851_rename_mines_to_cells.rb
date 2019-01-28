class RenameMinesToCells < ActiveRecord::Migration[5.2]
  def change
    rename_table :mines, :cells
  end
end
