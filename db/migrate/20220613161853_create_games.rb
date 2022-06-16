class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :platform
      t.boolean :completed

      t.timestamps
    end
    add_reference :games, :user, null: false, foreign_key: true
  end
end
