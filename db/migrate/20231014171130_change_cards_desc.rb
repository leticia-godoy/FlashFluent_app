class ChangeCardsDesc < ActiveRecord::Migration[7.0]
  def change
    change_column :cards, :description, :text
  end
end
