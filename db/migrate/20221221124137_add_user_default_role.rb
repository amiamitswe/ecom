class AddUserDefaultRole < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :boolean, :default => "user"
  end
end
