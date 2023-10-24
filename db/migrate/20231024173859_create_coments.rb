class CreateComents < ActiveRecord::Migration[7.0]
  def change
    create_table :coments do |t|
      t.text :description
      t.integer :user_id
      t.integer :card_id
      t.timestamps
    end
  end
end
