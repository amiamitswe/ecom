class UpdateStatusOnCategory < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :status,:boolean
  end
end
