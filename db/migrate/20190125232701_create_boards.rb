class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :rows
      t.integer :cols
      t.integer :mines_percentage
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
