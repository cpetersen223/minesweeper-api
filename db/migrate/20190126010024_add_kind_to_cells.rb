class AddKindToCells < ActiveRecord::Migration[5.2]
  def change
    add_column :cells, :kind, :integer
  end
end
