class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :word
      t.string :description
      t.integer :points
      t.timestamps
    end
  end
end
