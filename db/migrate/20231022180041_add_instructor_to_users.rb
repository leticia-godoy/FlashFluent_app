class AddInstructorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :instructor , :boolean, default: false
  end
end
