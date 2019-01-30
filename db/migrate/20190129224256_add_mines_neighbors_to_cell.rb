class AddMinesNeighborsToCell < ActiveRecord::Migration[5.2]
  def change
    add_column :cells, :mines_neighbors, :integer
  end
end
