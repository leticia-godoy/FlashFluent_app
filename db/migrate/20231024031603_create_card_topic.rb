class CreateCardTopic < ActiveRecord::Migration[7.0]
  def change
    create_table :card_topics do |t|
      t.integer :card_id
      t.integer :topic_id
    end
  end
end
