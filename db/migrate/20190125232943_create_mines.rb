class CreateMines < ActiveRecord::Migration[5.2]
  def change
    create_table :mines do |t|
      t.integer :x
      t.integer :y
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
