class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :player
      t.boolean :over,  default: false
      t.boolean :won,   default: false

      t.timestamps
    end
  end
end
